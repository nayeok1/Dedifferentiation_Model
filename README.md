# Dedifferentiation Model

### Introduction
Healthy tissue is charaterized by a specific structure, where stem cells are responsible for tissue maintance and give their designated function. Typically stem cells have own self-renewal ability but also differentiate into terminally differenitated cells. Data suggest that tissue homeostasis is maintained through existence of specific negative feedback loop that influence stem cell number and tissue size.     
It is thought that tumors are maintained by so caled cancer stem cell(CSC), and that the majority of the tumor is made up of more differentiated cancer cells that have limited ability to maintain the existence of the tumor. Similiarly, it has been suggested that feedback loops which regulate healthy tissue homeostasis are maintained to a certain extent in tumors, and observed tumor growth patterns support this notion.   
Both healthy tissue as well as tumor cell dynamics have been studied with mathematical models in the context of hierachically structured cell population. 

### Biological Model and parameters 
Here, we review the biological cartoon model of stem cell-driven tissue dynamics. In this form, this model contains two population: the stem cells: X0, and the more differentiated cells, X1. This model can correspond to either healthy tissue cell or to tumor cell populations, depending on the scenario to which the model is applied to.  
![cartoon](https://postfiles.pstatic.net/MjAxODEyMDVfMzQg/MDAxNTQzOTg1NjEzNDM4.b6xSl6o4QJ3rZwNgqqvATYkzRR8mE0o80B5kJBkNYgYg.OveI-ZLeuf6nYc3eXEMVGy134h1nj04XXixW2LcnK54g.PNG.nayeonkim93/image_8549736981543985599247.png?type=w773)

X0 = Stem Cell, X1 = Non-Stem Cell (differentiated cell)    
v0 = divison rate for X0, v1 = division rate for X1   
d0 = death rate for X0, d1 = death rate for X1   
r1 = dedifferentiation rate   
p = self-rewal probability    

### Mathematical Model 
This model is given by the following set of ordinary differential equations.   

![stem cell](http://latex.codecogs.com/gif.latex?x_%7B0%7D%27%20%3D%20%282p-1%29v_%7B0%7Dx_%7B0%7D%20-%20d_%7B0%7Dx_%7B0%7D%20&plus;r_%7B1%7Dx_%7B1%7D)   
![non stem cell](http://latex.codecogs.com/gif.latex?x_%7B1%7D%27%20%3D%202%281-p%29v_%7B0%7Dx_%7B0%7D%20&plus;%20%28v_%7B1%7D%20-%20d_%7B1%7D%29%20x_%7B1%7D%20-%20r_%7B1%7Dx_%7B1%7D)   
![feedback](http://latex.codecogs.com/gif.latex?p%20%3D%20%5Cfrac%7B%5Cbar%7Bp%7D%7D%7B1&plus;%5Cgamma%20x_%7B1%7D%7D)

Stem cells and differentiated cells are assumed to divided with a rate v0 and v1. For the stem cell division rate, this division result in the generation of 2 daughter stem cells with probability p (self-renewal). With a probability 1-p, the divison results in the generation of two differentiated cells. Therefore, divison is assume to be symmetric. Stem cells and differentiated cells are assumed to die with a rate d0 and d1. Finally, differentiatd cells are assumed to de-differentiate into stem cells with a constance r1.    

### Numerical Solution and Stochastic Gillespie Simulation
To analyze the system easier, we have assumed self-renewal probability p = 1, stem cell division rate v0 = 1, and 𝛾 =1 .   
#### System with feedback d0 = 0 and r1 ≠ 0

##### _Case1 : d1 < v1 + r1 with steady state :(0,0)_
![i.case1.ODE](https://blogfiles.pstatic.net/MjAxODEyMDVfMjMg/MDAxNTQ0MDAxOTYyMTU0.8FPXNfgEUo_UVWMzpfonAAL9syaykq2HIed79q_HGswg.O7lGNNzz08OOOcPRvJToVWU11OCF85SrOCEza09Qvzsg.JPEG.nayeonkim93/i.case1.ODE.jpeg)
![i.case1.SSA](https://blogfiles.pstatic.net/MjAxODEyMDVfMjE4/MDAxNTQ0MDAxOTcxMzMx.ozDmP2SEF2s8MjMlhjo-ISaB3ta_D68T7h_bMijqJzog.alU1Qoy5X8iCJZv1u8nFsnuGtf7tjTnSOMppTPp3uEog.JPEG.nayeonkim93/i.case1.SSA.jpeg)

      Parameter assumption: p = 1, v0 = 1, v1 =0.2, d0 = 0, d1 = 0.4, 𝛾 = 1, r1 = 1    
      Steady state is unstable. Both numerical solution and stochastic solution verified.

##### _Case 2: d1 > v1 + r1 with steady state:(0.67,1.67)_

![i.case2.ODE](https://blogfiles.pstatic.net/MjAxODEyMDVfMjk3/MDAxNTQ0MDAyNTU0Mzky.hboNEOxAB3guvgQWpzMKkPfkwSn1tOOeT9jAS2dDff8g.8hJKSFpMAhnGUzGnp6yJywpUYaSolpNK3cW3XesMxMYg.JPEG.nayeonkim93/i.case2.ODE.jpeg)
![i.case2.SSA](https://blogfiles.pstatic.net/MjAxODEyMDVfNTAg/MDAxNTQ0MDAyNTU4NTgx.x1zDd4u7On1w5W8bsFm5gyXb1vifv6FKZX8w5pzgnbAg.Ln6DMwlT4IiVQ14wCDICGNzq1aVM4HFhtoDOFKcvfhog.JPEG.nayeonkim93/i.case2.SSA.jpeg)

      Parameter assumption: p = 1, v0 = 1, v1 =0.2, d0 = 0, d1 = 0.6, 𝛾 = 1, r1 = 0.1    
      Steady state is stable. Both numerical solution and stochastic solution verified.

#### System with feedback d0 ≠ 0 and r1 = 0

##### _Case 1: |(1-d0)(v1-d1)| < 8(1+d0)_
![ii.case1.ODE](https://blogfiles.pstatic.net/MjAxODEyMDVfMTgy/MDAxNTQ0MDAzMzU0MDE1.lrVyhmpqj47n85DUboi3E3GmT4rGubQWYbjYkftkyfkg.CCMth8LpxL9p1VqSHamlFqLPGH-NFP45VhBYMfksmlQg.JPEG.nayeonkim93/ii.case1.ODE.jpeg)
![ii.case1.SSA](https://blogfiles.pstatic.net/MjAxODEyMDVfMTk5/MDAxNTQ0MDAzMzU3ODI3.36psw1Wlf2ICIIwUB-nlyZ9LFXWhSPVMP2BPQ1Vys8Ug.dC4qyQOuK_NJ5ej420WC69IIAtUejKU426SElRr66akg.JPEG.nayeonkim93/ii.case1.SSA.jpeg)

      Parameter assumption: p = 1, v0 = 1, v1 =0.1, d0 = 0.1, d1 = 1, 𝛾 = 1, r1 = 0    
      Steady state is stable. Both numerical solution and stochastic solution verified.
      
##### _Case 2: |(1-d0)(v1-d1)| > 8(1+d0)_
![ii.case2.ODE](https://blogfiles.pstatic.net/MjAxODEyMDVfMzMg/MDAxNTQ0MDA1MjgzMDU1.erRwSEUFJFPD3JBb4DsA4em_6vZhNdb_FED1LBBJo00g.h9ln6xYgkl78G2XFzJF5fEfp7V61R_qNekGP0L_j6gAg.JPEG.nayeonkim93/ii.case2.ODE.jpeg)
![ii.case2.SSA](https://blogfiles.pstatic.net/MjAxODEyMDVfNjQg/MDAxNTQ0MDA1Mjg3ODU0.uydAxRS-M6yj1w3AvpXuwLdyIMvEUJWOYtey0X_Qorog.fbeGqyvVhohGNGrHuoTA_imKMN4lHt_VnZQaWkI2UCIg.JPEG.nayeonkim93/ii.case2.SSA.jpeg)

      Parameter assumption: p = 1, v0 = 1, v1 =0.1, d0 = 0.1, d1 = 11, 𝛾 = 1, r1 = 0    
      Steady state is stable. Both numerical solution and stochastic solution verified.

#### System with feedback d0 ≠ 0 and r1 ≠ 0
