# Algarve ground water monitoring

## 🚀 Motivation
Algarve region in south Portugal is experiencing a multi-year drought of 10 years.  [Agência Portuguesa do Ambiente (APA)][1] in Faro is responsible for monitoring groundwater level (quantity status)  and quality (Chemical status) in its 25 separate groundwater bodies, which correspond to 17 main aquifers. The monitoring of the groundwater levels is usually performed with a monthly frequency in around 150 observation points (wells) spread around the groundwater bodies.

Below is the map of groundwater levels of in Algarve for one of the main aquifers in the region, called Querença-Silves aquifer (M5), which shows that during the month of September 2023, groundwater levels reached negative values compared to mean-sea-level, thus, increasing the risk of sea water intrusion, which could have unprecedented consequences for the citizens, businesses and the region as a whole.

<img src="https://github.com/Py-ualg/2024-code-blue/blob/main/challenges/Ground_water/Piezo_QS_092023.jpg" width="700"/>

![Detail of the western region](https://github.com/Py-ualg/2024-code-blue/tree/main/challenges/Ground_water/Piezo_QS_092023_SectorOcidental.jpg?raw=true)

## 🛠️ Tools
1. Visualization in any automated plotting environment
2. Interpolation maps (Inverse distance weighted (IDW) interpolation, [wiki][2], [python repo][3] or [Kriging][5], which is a more powerful interpolator and allows to assess uncertainty)
3. API does not exist for the aquifer data, which are however publicly available (see [Data section](#-data))


## 🔦 Possible directions for the teams
1. We are all part of the problem, and we should be part of a robust solution. Find ways how to communicate the urgency of the droughts.
2. Create an API as an efficient starting point for information campaigns based on the APA data.
3.  Official Reporting of APA goes to EU, on the SNIRH website, it is possible to have a general view on the quantity status of the groundwter bodies [here][6] though this is not easy to navigate, and does not provide solid interpolation analysis.
4. Predictive modeling by including precipitation data.
5. Economically optimized measures based on business consumption, location, priorities, etc. Well distributed and timely measures should lead to broad consensus, economic effectiveness, and sustainable livelihood.
6. Include satellite data for surface water reservoirs. There are 6 main surface water reservoirs on the Algarve, 3 of which for multiple purposes (irrigation and public water supply), 2 for public water supply and 1 for irrigation. The main criterion for managing surface water bodies is to guarantee 2-year average water for public supply.
7. Visualization app for the local population and visitors.

## 💾 Data
 
* All APA data are [here][4] but without API.

## 💁 Info and mentoring
Luis Costa, APA

[1]: https://apambiente.pt/
[2]: https://en.wikipedia.org/wiki/Inverse_distance_weighting
[3]: https://github.com/paulbrodersen/inverse_distance_weighting
[4]: https://snirh.apambiente.pt/
[5]: https://github.com/GeoStat-Framework/PyKrige
[6]: https://snirh.apambiente.pt/index.php?idMain=1&idItem=1.4&idSubItem=BOL