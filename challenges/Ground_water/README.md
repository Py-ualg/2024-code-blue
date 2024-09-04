# Algarve ground water monitoring

## 🚀 Motivation
Algarve and most of the Portugal is experiencing 10 years of droughts. [Agência Portuguesa do Ambiente (APA)][1] in Faro is responsible for monitoring the ground water levels in 7 separate aquifers which have around 150 probe stations.

Below is the map of water levels of in Algarve west-coast aquifer, which shows that at some point it was 40cm from being contaminated by the sea water, which could have
unprecedented consequences for the 

## 🛠️ Tools

For public use, they are quite limited

1. Visualization in any automated plotting environment
2. Interpolation maps (Inverse distance weighted (IDW) interpolation, [wiki][2], [python repo][3])
3. API does not exist for the aquifer data, which are however publicly available (see [Data section](#-data))


## 🔦 Possible directions for the teams
1. We are all part of the problem, and we should be part of a robust solution. Find ways how to communicate the urgency of the droughts.
2. Create an API as an efficient starting point for information campaigns based on the APA data.
3. Reporting of APA goes to EU only. Should Portugal state care more, and provide reports often. Help that happen.
4. Predictive modeling by including precipitation data.
5. Economically optimized measures based on business consumption, location, priorities, etc. Well distributed and timely measures should lead to broad consensus, economic effectiveness, and sustainable livelihood.
6. Include satellite data for surface water reservoirs. Their only reporting date is 31/12, when the dam needs to contain a 2-year average consumption of water.
7. Visualization app for the local population and visitors.

## 💾 Data
 
* All APA data are [here][4] but without API.

## 💁 Info and mentoring
Luis Costa, APA

[1]: https://apambiente.pt/
[2]: https://en.wikipedia.org/wiki/Inverse_distance_weighting
[3]: https://github.com/paulbrodersen/inverse_distance_weighting
[4]: https://snirh.apambiente.pt/