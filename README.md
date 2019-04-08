# IsingFrictionSteps2016

This repo includes sources codes and a makefile for a Monte Carlo simulation program of the Ising model with
- two-dimensional rectangular geometry ($ L_x * L_z $),
- heat-bath with the temperature $ T $,
- sliding plane with the velocity $ v $.

The simulation program is mainly intended to reproduce some results of the Ref.<sup>[1](#Kadau)</sup> and so on, and extend the results. The simulation was also used to generate the result of my paper<sup>[2](#Sugimoto)</sup>.

This repo is different from the repo <a href="https://github.com/tarotene/compphys-IsingFriction2016">IsingFriction2016</a> only in that *this intends the step-like stream*, while the repo <a href="https://github.com/tarotene/compphys-IsingFriction2016">IsingFriction2016</a> intends to the sweep-like stream. We are going to merge this repo into <a href="https://github.com/tarotene/compphys-IsingFriction2016">IsingFriction2016</a> in the future for this reason. 

<a name="Kadau">1</a>: https://arxiv.org/abs/0706.3610; 
<a name="Sugimoto">2</a>: https://arxiv.org/abs/1812.03344

TODO: Add a description about its fundamental interface and the simulation protocol.

Notice: This repo have not been maintained for a long time. Makefile especially does not work properly. But the program itself *probably* works correctly.