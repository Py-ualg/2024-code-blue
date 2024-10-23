#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
# Libraries needed for those examples below
library(ggplot2)
library(maps)
library(dplyr)
library(png)


# Define UI for application that draws a histogram
ui <- fluidPage(

    titlePanel(""),

    # Sidebar with a slider input for the year to plot
    sidebarLayout(
        sidebarPanel(
            h3("Plot Selection"),
            radioButtons( 
              inputId = "quantity", 
              label = "Quantity", 
              choices = list(
                "Catch [tons]" = 1, 
                "Effort [Hooks]" = 2, 
                "Catch per Effort" = 3 
              )
            ),
            sliderInput("year", "Year:", min = 2000, max = 2022, step = 1, value = 2022),
            p("Code Blue fishery monitoring challenge"),
            p("Bernd Kischnick <kisch@ki.sch-co.de> 2024")
        ),

        # Show a plot of the generated distribution
        mainPanel(
          # Application title
          h1("Longline Fishing in the Atlantic"),
          
          # the plot
          plotOutput("map"),
          plotOutput("plot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  output$map <- renderPlot({
    # choose quantity to plot based on control
    plot <- plots[[as.numeric(input$quantity)]]
    
    # plot map. clip colour scale because of a couple of large outlier values
      ggplot(filter(plot$data, YearC == input$year), aes(x = xLon5, y = yLat5, fill = quantity)) +
        geom_tile() + 
        borders("world", colour = "lightgray", fill = "gray") +
        do.call(scale_fill_gradientn, c(list(
          colors = c("white", "#fca636", "#b12a90", "#0d0887"), name = plot$legend),
          plot$legend_args)) +
        coord_fixed(ratio = 1.3) +
        theme_bw() +
        labs(title = sprintf("%s - Year %d", plot$title, input$year), x = "Longitude", y = "Latitude")
  })
    
  output$plot <- renderPlot({
    # choose quantity to plot based on control
    plot <- plots[[as.numeric(input$quantity)]]
    
    ggplot(plot$data %>% group_by(YearC) %>% summarise(quantity = sum(quantity)), aes(x = YearC, y = quantity)) +
    geom_line(color = "grey", size = 1) +
    geom_point(color = "darkgrey", size = 2) + 
    geom_vline(xintercept = input$year) +
    theme_minimal() +
    labs(title = sprintf("%s over Time (2000-2022)", plot$title),
         x = "Year",
         y = plot$legend)
  })
}

# Set Directory - whre data is in my PC
setwd("./data")

# Load example of catch data - catdis
catch <- read.table("cdis5022-all9sp.csv", header=T, sep=",", dec=".", na.strings=NA)

# Load example of effort data - effdis
effort <- read.table("EFFDIS_LL2000-22.csv", header=T, sep=",", dec=".", na.strings=NA)

# Some categorization of variables needed for ploting, etc
catch$SpeciesCode <- factor(catch$SpeciesCode)
catch$FlagName <- factor(catch$FlagName)
catch$FleetCode <- factor(catch$FleetCode)
catch$Stock <- factor(catch$Stock)
catch$GearGrp <- factor(catch$GearGrp)
effort$FlagName <- factor(effort$FlagName)
effort$FleetCode <- factor(effort$FleetCode)

# - BUILD CPUE DATA (combine catch and effort - e.g. tons of catch standardized for effort in 1000 hooks)
#   - Explore where higher CPUES exist in the Atlantic - those can be hotspots for the species, locations with higher densities

# to match effort and catch datasets, adapt both
# rename columns, filter for years and longline gear, summarise
cpue_catch <- catch %>%
  rename(. , xLon5 = xLon5ctoid, yLat5 = yLat5ctoid) %>%
  filter(YearC >= 2000) %>%
  filter(GearGrp == "LL") %>%
  group_by(., YearC, xLon5, yLat5) %>%
  summarise(Catch_t = sum(Catch_t)) %>%
  ungroup()

# summarise over columns that we don't use
cpue_effort <- effort %>%
  group_by(., YearC, xLon5, yLat5) %>%
  summarise(TotalEstimatedEffort = sum(TotalEstimatedEffort)) %>%
  ungroup()

# create matched dataset, calculate CPUE, assuming non-available catch as 0
cpue = left_join(cpue_effort , cpue_catch) %>%
  mutate(. , quantity = tidyr::replace_na(Catch_t, 0) / TotalEstimatedEffort * 1000)

# rename plottable column for uniformity
cpue_catch <- rename(cpue_catch, quantity = Catch_t)
cpue_effort <- rename(cpue_effort, quantity = TotalEstimatedEffort)

plots <- list(
  qu1 = list(title = "Fishing Catch",
       legend = "Catch [tons]",
       legend_args = list(limits = c(0, 8000)),
       data = cpue_catch,
       summary = cpue_catch %>% group_by(YearC) %>% summarise(quantity = sum(quantity))
  ),
  qu2 = list(title = "Estimated Fishing Effort",
       legend = "Effort [N hooks]",
       legend_args = list(limits = c(0, 40000000)),
       data = cpue_effort,
       summary = cpue_catch %>% group_by(YearC) %>% summarise(quantity = sum(quantity))
  ),
  qu3 = list(title = "Catch per Unit Effort",
       legend = "CPUE (t/1000 hooks)",
       legend_args = list(limits=c(0, 20), oob=scales::squish),
       data = cpue,
       summary = cpue_catch %>% group_by(YearC) %>% summarise(quantity = sum(quantity))
  )
)

# Run the application 
shinyApp(ui = ui, server = server,
  options = list(
  host = "127.0.0.1", port = 4711, appDir = "."
)
)
