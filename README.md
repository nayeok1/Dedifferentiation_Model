# Dedifferentiation Model

### Introduction
Healthy tissue is charaterized by a specific structure, where stem cells are responsible for tissue maintance and give their designated function. Typically stem cells have own self-renewal ability but also differentiate into terminally differenitated cells. Data suggest that tissue homeostasis is maintained through existence of specific negative feedback loop that influence stem cell number and tissue size.     
It is thought that tumors are maintained by so caled cancer stem cell(CSC), and that the majority of the tumor is made up of more differentiated cancer cells that have limited ability to maintain the existence of the sumor. Similiarly, it has been suggested that feedback loops which regulate healthy tissue homeostasis are maintained to a certain extent in tumors, and observed tumor growth patterns support this notion.   
Both healthy tissue as well as tumor cell dynamics have been studied with mathematical models in the context of hierachically structured cell population. 

### Biological Model and parameters 
Here, we review the biological cartoon model of stem cell-driven tissue dynamics. In this form, this model contains two population: the stem cells: X0, and the more differentiated cells, X1. This model can correspond to either healthy tissue cell or to tumor cell populations, depending on the scenario to which the model is applied to.  
![cartoon](https://postfiles.pstatic.net/MjAxODEyMDVfMzQg/MDAxNTQzOTg1NjEzNDM4.b6xSl6o4QJ3rZwNgqqvATYkzRR8mE0o80B5kJBkNYgYg.OveI-ZLeuf6nYc3eXEMVGy134h1nj04XXixW2LcnK54g.PNG.nayeonkim93/image_8549736981543985599247.png?type=w773)

X0 = Stem cell, X1 = Non-Stem Cell    
v0 = divison rate for X0, v1 = division rate for X1   
d0 = death rate for X0, d1 = death rate for X1   
r1 = dedifferentiation rate   
p = self-rewal probability    

### Mathematical Model 
This model is given by the following set of ordinary differential equations.   

![stem cell](http://latex.codecogs.com/gif.latex?x_%7B0%7D%27%20%3D%20%282p-1%29v_%7B0%7Dx_%7B0%7D%20-%20d_%7B0%7Dx_%7B0%7D%20&plus;r_%7B1%7Dx_%7B1%7D)   
![non stem cell](http://latex.codecogs.com/gif.latex?x_%7B1%7D%27%20%3D%202%281-p%29v_%7B0%7Dx_%7B0%7D%20&plus;%20%28v_%7B1%7D%20-%20d_%7B1%7D%29%20x_%7B1%7D%20-%20r_%7B1%7Dx_%7B1%7D)   
![feedback](http://latex.codecogs.com/gif.latex?p%20%3D%20%5Cfrac%7B%5Cbar%7Bp%7D%7D%7B1&plus;%5Cgamma%20x_%7B1%7D%7D)

Stem cells are assumed to divided with a rate v0. This division result in the generation of 2 daughter stem cells with probability p (self-renewal). With a probability 1-p, the divison results in the generation of two differentiated cells. 
