# AI for optically detected fruit quality

## 🚀 Motivation
Traditionally, 1000s of fruits are sampled and manually analyzed pre-harvest to provide insight into the fruit maturation and quality.

Internal defects, sugar content, dry matter content, are some of the parameters deciding optimal harvest time, resulting profits and customer content. These chemical composition translates into optical signal in a non-trivial way and chemometrics models try to do that quantitatively. Analytical methods are accurate (Ground truth) but slow and expensive. With advent of AI, machine-learning/deep-learning models can do that at scale, non-invasively. [Dario Passos][1] from CEOT (UAlg) is expert in designing such models. They are applicable in agriculture, but also in medicine, biotechnology etc.

This is a perfect opportunity to dive into DL, convolutional neural networks and other machine learning techniques, because no unified architecture for chemometrics exists as of today. Moreover the collected data are 1D spectra, much easier to work with compared to large 2D images.

## 🛠️ Tools

Here is Dario's great [compilation][2] of notebooks and materials to get you started with DL for chemmometrics.

## 🔦 Possible directions for the teams

1. Consumer systems are an unexplored territory. Disregarding the hardware (or not?), can you design a mobile app with classification of the fruit quality?
2. Dario can provide a curated training dataset, and you can experiment with architectures to achieve the best possible score on his hidden test data (Kaggle style)
3. Translate the QA techniques to other products, such as fish-markets in Algarve.

## 💾 Data

* For Kaggle style of challenge, datasets and starter's NB can be found in `challenge_data` folder.

## Complementary Resources
* PDF article "Perspectives on deep learning for near-infrared spectral data modelling": It provides a high level overview of the challenges and opportunities of Deep Learning for Chemometrics and NIR spectral analysis.
* [Youtube playlist][5] from "Deep Learning for NIR Chemometrics" hosted at UAlg in March 2024.

## 💁 Info and mentoring
Dário Passos (CEOT, UAlg), [LI][3], [Google scholar][4], [GitHub][1]

[1]: https://github.com/dario-passos
[2]: https://github.com/dario-passos/DeepLearning_for_VIS-NIR_Spectra
[3]: https://www.linkedin.com/in/dariopassos/
[4]: https://scholar.google.co.uk/citations?hl=en&user=OiJ60TAAAAAJ
[5]: https://www.youtube.com/playlist?list=PLu513tnmHNHePHVwARu-0oVKJg1zWWjrp