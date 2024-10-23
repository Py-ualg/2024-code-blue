# Fisheries Monitoring and open Source Data

## 🚀 Motivation
Instituto Português do Mar e da Atmosfera (IPMA) is a Public Institute responsible for, among other tasks, carrying out stock assessment and monitor species that are commercially fished and provide management advice on the sustainable use of those resources.
This challenge provides and opportunity to work in fisheries, especially related with large migratory species that the tutor is an expert. The main objectives would be to collate various datasets on catch-and-effort, that could then be used to track species abundance and status of the fishing stocks. A final objective would be to develop a visualization tool that is informative not only for scientists, but also managers and the general public.

## 🛠️ Tools

* TBA

## 🔦 Possible directions for the teams

1. Monitoring data on fishing effort based on reports and publicly available vessel tracking datasets.
2. Monitoring data on catches of commercially important species from publicly available datasets
3. Integrate several databases into a [Retrieval-augmented generation (RAG)][4] application to query diverse data.
4.	Model catch-and-effort data to produce indices of species abundance over time, used as indicators of population trends
5.	Produce ways to visualize the results. Those should be suitable for scientists, for managers that decide on management actions, and for the general public that might want simple and clear information on consumer practices and choices
6. What can be improved? What additional monitoring and reporting is missing?

## 💁‍♂️ Solution
One man show team, Bernd Kishnick, developed a dashboard for the overall fish catches and efforts in the atlantic ocean. It is written in R shiny and after cloning the repository and installing dependencies, the user can run the code in RStudio or simply by

```
Rscript .\Shiny_dashboard\app.R
```
in this directory. Have fun, create PRs if you are interested in improving the dashboard.

## 💾 Data

* [Global fishing watch][5] (fishing effort).
* Public [database of catches][6] of pelagic species in the Atlantic. Here is a [dashboard created based on that data][7].
* IPMA [API for weather data][3]

## 💁 Info and mentoring
Rui Coelho (IPMA), [Google scholar][2]

[1]: https://www.ipma.pt/pt/index.html
[2]: https://scholar.google.co.uk/citations?hl=en&user=WXqH1ZQAAAAJ
[3]: https://api.ipma.pt/
[4]: https://en.wikipedia.org/wiki/Retrieval-augmented_generation
[5]: https://globalfishingwatch.org/our-apis/
[6]: https://www.iccat.int/Data/t1nc_20240131.7z
[7]: https://app.powerbi.com/view?r=eyJrIjoiNzFmYTg4NmEtNDhjNy00NWUxLThhZjYtNzRjMmI4MjJiODUwIiwidCI6IjQzYWUxY2NmLTA0NGYtNDAxMy1hNzUwLWZjNWQ2NjAwMTlmYSIsImMiOjl9
