# Inductiva.AI

## 🚀 Motivation

Numerical simulations are a fundamental tool in several domains of industrial and academic research.

Running large-scale simulations, however, requires expert knowledge not only in the simulation domain and the simulator software, but also in computational infrastructure.

With Inductiva, a cloud-based **High-Performance Computing (HPC)** platform designed to run numerical simulations, it's easy to run simulations at scale in powerful computational infrastructure without the complex infrastructure management, all from within familiar Python code.

The Inductiva API integrates open-source simulators that span several domains (GROMACS for molecular dynamics, OpenFOAM for fluid dynamics, SWASH for coastal dynamics, among many others).

Inductiva challenges you to come up with an use case of the Inductiva Python API to run a simulation related to the ocean, providing Jupyter notebooks to easily get you started a coastal dynamics simulation.

## 🛠️ Tools

1. [Inductiva API](https://inductiva.ai/): follow the `Get started now` button to create an account in the Inductiva API and get access to an API key.

2. Check the following notebooks with examples of using the Inductiva API for coastal dynamics simulations. If you don't have Python and Jupyter installed in your machine, you can open them directly in Google Colab.
    - [Notebook 1](coastal_area.ipynb): run a SWASH simulation of waves in a coastal area. ([open in Google Colab](https://githubtocolab.com/Py-ualg/2024-code-blue/tree/main/challenges/inductivaAI/coastal_area.ipynb))
    - [Notebook 2](coastal_area_modify_inputs.ipynb): learn how to easily manipulate the input configuration of the previously example simulation. ([open in Google Colab](https://githubtocolab.com/Py-ualg/2024-code-blue/tree/main/challenges/inductivaAI/coastal_area_modify_inputs.ipynb))

## 🔦 Possible directions for the teams

1. Come up with an interesting visualization for a simulation.
    - You could explore tools such as [PyVista](https://pyvista.org/) or [Blender](https://www.blender.org/).
2. Train an ML model using synthetic data, for example, to predict the size of a wave in a given point of the coast for different initial conditions of wave amplitude and period.
    - Start by generating a small dataset by running the same simulation case with different input parameters.
3. Explore other bathymetry data (*e.g.*, try to use real bathymetry data from the [Algarve coast](https://emodnet.ec.europa.eu/geonetwork/emodnet/search?orgName=Portuguese%20Geographical%20Institute)) and tweak the simulation, for instance, by including a breakwater.
4. If you're already experienced or interested in another [simulator integrated in the API](https://inductiva.ai/simulators), check them out (**e.g.**, [XBeach](https://docs.inductiva.ai/en/latest/simulators/XBeach.html), [Reef3D](https://docs.inductiva.ai/en/latest/simulators/Reef3D.html)).
5. Be creative. If you have any other ideas that better align with your background to explore the Inductiva API, talk to us and let's brainstorm!

## Complementary Resources

* [SWASH](https://www.tudelft.nl/citg/over-faculteit/afdelingen/hydraulic-engineering/sections/environmental-fluid-mechanics/research/swash) simulator
* SWASH [user manual](https://swash.sourceforge.io/online_doc/swashuse/swashuse.html)

## 💁 Info and mentoring

Luís Cunha (Engineer at Inductiva.AI), [LI][3], [GitHub][4]\
Francisco Nogueira (Engineer at Inductiva.AI), [LI][5], [GitHub][6]\

[1]: https://docs.inductiva.ai/en/latest/
[2]: https://tutorials.inductiva.ai/
[3]: https://www.linkedin.com/in/luispcunha/
[4]: https://github.com/luispcunha
[5]: https://www.linkedin.com/in/franreno/
[6]: https://github.com/franreno
