#####################################################################
###       Blue Biotech Hackathon - Albufeira - 18-20 Out 2024     ###  
### Examples of analysis/plots with large migratory species data  ###
###          R v 4.3.1 - RUI COELHO - rpcoelho@ipma.pt  v1.0      ###
###          Bernd Kischnick <codeblue@ki.sch-co.de>    v1.1      ###
#####################################################################

# Libraries needed for those examples below
library(ggplot2)
library(maps)
library(dplyr)
library(manipulate)

# Set Directory - whre data is in my PC
setwd("./data")

# Load example of catch data - catdis
catch <- read.table("cdis5022-all9sp.csv", header=T, sep=",", dec=".", na.strings=NA)
head(catch, 20)
str(catch)
summary(catch)

# Load example of effort data - effdis
effort <- read.table("EFFDIS_LL2000-22.csv", header=T, sep=",", dec=".", na.strings=NA)
head(effort, 20)
str(effort)
summary(effort)

# Some categorization of variables needed for ploting, etc
catch$SpeciesCode <- factor(catch$SpeciesCode)
catch$FlagName <- factor(catch$FlagName)
catch$FleetCode <- factor(catch$FleetCode)
catch$Stock <- factor(catch$Stock)
catch$GearGrp <- factor(catch$GearGrp)
effort$FlagName <- factor(effort$FlagName)
effort$FleetCode <- factor(effort$FleetCode)


#######################################
# EXAMPLE ANALYSIS OF FISHING EFFORT  #
#######################################

######
### MAPS OF FISHING EFFORT

# Aggregate the data
# each line contains an estimated number of hooks.
# For this example I want to agreggate everything for a measure of total effort (all fleets and all years combined)
total_effort <- effort %>%
  group_by(xLon5, yLat5) %>%
  summarise(TotalEstimatedEffort = sum(TotalEstimatedEffort, na.rm = TRUE))

# example of map with ggplot2
total.effort.map <- ggplot(total_effort, aes(x = xLon5, y = yLat5, fill = TotalEstimatedEffort)) +
  geom_tile() + 
  borders("world", colour = "lightgray", fill = "gray") +
  scale_fill_gradientn(
      colors = c("white", "#fca636", "#b12a90", "#0d0887"),name = "Total effort (N hooks)") +
  coord_fixed(ratio = 1.3) +
  theme_bw() +
  labs(title = "Total Estimated Longline Fishing Effort - Atlantic - 5x5 Grid", x = "Longitude", y = "Latitude")
print(total.effort.map)

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
  summarise(TotalEstimatedEffort=sum(TotalEstimatedEffort)) %>%
  ungroup()

# create matched dataset, calculate CPUE, assuming non-available catch as 0
cpue = left_join(cpue_effort , cpue_catch) %>%
  mutate(. , CPUE = tidyr::replace_na(Catch_t, 0) / TotalEstimatedEffort * 1000)

# summarise over years to plot
total_cpue <- cpue %>% group_by(xLon5, yLat5) %>% summarise(CPUE = sum(CPUE))

# plot map. clip colour scale because of a couple of large outlier values
manipulate({
  ggplot(filter(cpue, YearC == myyear), aes(x = xLon5, y = yLat5, fill = CPUE)) +   geom_tile() + 
    borders("world", colour = "lightgray", fill = "gray") +
    scale_fill_gradientn(
      colors = c("white", "#fca636", "#b12a90", "#0d0887"), name = "CPUE (t/1000 hooks)",
      limits=c(0, 20), oob=scales::squish) +
    coord_fixed(ratio = 1.3) +
    theme_bw() +
    labs(title = sprintf("Longline Fishing CPUE - Year %d - Atlantic 5x5", myyear), x = "Longitude", y = "Latitude")
  },
  myyear = slider(min = 2000, max = 2022, step = 1)
)


#######
### PLOTS - E.g., evolution of fishing effort over time

# Aggregate the total effort data by Year
yearly.effort <- effort %>%
  group_by(YearC) %>% 
  summarise(TotalEffort = sum(TotalEstimatedEffort, na.rm = TRUE))

# Make line plot with ggplot2
total.effort.trend <- ggplot(yearly.effort, aes(x = YearC, y = TotalEffort)) +
  geom_line(color = "grey", size = 1) +
  geom_point(color = "darkgrey", size = 2) + 
  theme_minimal() +
  labs(title = "Estimated Longline Fishing Effort Over Time (Atlantic - 2000-2022)",
       x = "Year",
       y = "Estimated Effort (Nº hooks)") +
  theme(plot.title = element_text(hjust = 0.5))  # Center the title
print(total.effort.trend)


########################################
# EXAMPLE ANALYSIS OF FISHING CATCHES  #
########################################

######
### MAP OF Catches - example for 1 species (e.g., swordfish - SWO)

# Select data from SpeciesCode = SWO
catch.SWO <- subset(catch, catch$SpeciesCode=="SWO")

# Aggregate the SWO catch data
# each line contains an estimated total catch, so here we agregate for the total by location.
total.catch.SWO <- catch.SWO %>%
  group_by(xLon5ctoid, yLat5ctoid) %>%
  summarise(TotalCatch = sum(Catch_t, na.rm = TRUE))

# example of map with ggplot2
map.catch.SWO <- ggplot(total.catch.SWO, aes(x = xLon5ctoid, y = yLat5ctoid, fill = TotalCatch)) +
  geom_tile() + 
  borders("world", colour = "lightgray", fill = "gray") +
  scale_fill_gradientn(
  colors = c("white", "#fca636", "#b12a90", "#0d0887"),name = "Catch (t)") +
  coord_fixed(ratio = 1.3) +
  theme_bw() +
  labs(title = "Total Estimated SWO Catch - Atlantic - 5x5 Grid", x = "Longitude", y = "Latitude")
print(map.catch.SWO)


#######
### PLOTS - E.g., evolution of SWO catch over time

# Aggregate the total effort data by Year
yearly.catch.SWO <- catch.SWO %>%
  group_by(YearC) %>% 
  summarise(catch.SWO = sum(Catch_t, na.rm = TRUE))

# Make a quick line plot of yearly SWO catches with ggplot2
SWO.catch.trend <- ggplot(yearly.catch.SWO, aes(x = YearC, y = catch.SWO)) +
  geom_line(color = "grey", size = 1) +
  geom_point(color = "darkgrey", size = 2) + 
  theme_minimal() +
  labs(title = "Total swordfish catches over time (All Atlantic, All fleets)",
       x = "Year",
       y = "Total catch (tons)") +
  theme(plot.title = element_text(hjust = 0.5))
print(SWO.catch.trend)


#######
### PLOTS - E.g., fishing gears catching swordfish

# Make a simple boxplot for seeing the various fishing gears
SWO.catch.gears <- ggplot(catch.SWO, aes(x = GearGrp, y = Catch_t)) +
  geom_boxplot()+
  theme_minimal() +
  labs(title = "Swordfish catches by gear",
       x = "Fishing gear group",
       y = "Catch (t)")
print(SWO.catch.gears)
# This is not yet doing what we want to see, need to improve...


##########################
# SOME ADDITIONAL IDEAS: #
##########################

# - EFFORT DATA
#   - Can make maps for each year to see evolution of effort in the Atlantic - can make than as an automated process
#   - Can use the yearly maps above to create a video of the sequence of images/years over time
#   - Make maps for each fleet/country - can also be an automated process
#   - Make maps by quarter to see any trends
#   - use the Global Fishing Watch API to download satellite vessel tracking data and compare
#   - https://globalfishingwatch.org/our-apis/
#   - ...

# - CATCH DATA
#   - Make plots for other species (database has 9 main species) - can use some automation code
#   - See where the different species occur (some more tropical and some more temperate)
#   - Explore if catches have some yearly and/or seasonal trends - can automate and make sequence of plots/videos
#   - Explore what fishing gears catch different species
#   - Boxplot of fishing gears is not working well. Think about the database structure and what needs to be processed before plotting, to understand the true catch of each fishing gear
#   - ...

