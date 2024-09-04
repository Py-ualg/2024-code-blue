# AI for optically detected fruit quality

## 🚀 Motivation
Traditionally, 1000s of fruits are sampled and manually analyzed pre-harvest to provide insight into the fruit quality.

Internal defects, sugar content, water content, are some of the parameters deciding optimal harvest time, resulting profits and customer content. These chemical properties translate into optical signal in a non-trivial way, which is ubiquitous for any chemistry. Analytical methods are accurate (Ground truth) but slow and expensive. With advent of AI, indirect optical methods and machine-learning/deep-learning models can do that at big scale and non-invasively. [Dario Passos][1] from CEOT (UAlg) is expert in designing such models. They are applicable in agriculture, but also in medicine, biotechnology etc.

This is a perfect opportunity to dive into DL, convolutional neural networks and other DL models, because no unified architecture for chemometrics exists as of today. Moreover the collected data are 1D spectra, much easier to work with compared to large 2D images.

## 🛠️ Tools

Here is Dario's great [compilation][2] of notebooks and materials to get you started with DL for chemmometrics.

## 🔦 Possible directions for the teams

1. Consumer systems are an unexplored territory. Disregarding the hardware (or not?), can you design a mobile app with classification of the fruit quality?
2. Dario can provide a curated training dataset, and you can experiment with architectures to achieve the best possible score on his hidden test data (Kaggle style)
3. Translate the QA techniques to other products, such as fish-markets in Algarve.

## 💾 Data

* Publicly available datasets can be found here
    * link 1
    * link 2
* For Kaggle style of challenge, dataset will be published on Friday 18/10

[1]: https://github.com/dario-passos
[2]: https://github.com/dario-passos/DeepLearning_for_VIS-NIR_Spectra