# Dedifferentiation Model

### Biological Model
![cartoon](https://postfiles.pstatic.net/MjAxODEyMDVfMzQg/MDAxNTQzOTg1NjEzNDM4.b6xSl6o4QJ3rZwNgqqvATYkzRR8mE0o80B5kJBkNYgYg.OveI-ZLeuf6nYc3eXEMVGy134h1nj04XXixW2LcnK54g.PNG.nayeonkim93/image_8549736981543985599247.png?type=w773)

X0 = Stem cell   
X1 = Non-Stem Cell    
v0 = divison rate for X0   
v1 = division rate for X1   
d0 = death rate for X0   
d1 = death rate for X1   
r1 = dedifferentiation rate    
p = sel-rewal probability    

### Mathematical Model 
![stem cell](http://latex.codecogs.com/gif.latex?x_%7B0%7D%27%20%3D%20%282p-1%29v_%7B0%7Dx_%7B0%7D%20-%20d_%7B0%7Dx_%7B0%7D%20&plus;r_%7B1%7Dx_%7B1%7D)   
![non stem cell](http://latex.codecogs.com/gif.latex?x_%7B1%7D%27%20%3D%202%281-p%29v_%7B0%7Dx_%7B0%7D%20&plus;%20%28v_%7B1%7D%20-%20d_%7B1%7D%29%20x_%7B1%7D%20-%20r_%7B1%7Dx_%7B1%7D)   
![feedback](http://latex.codecogs.com/gif.latex?p%20%3D%20%5Cfrac%7B%5Cbar%7Bp%7D%7D%7B1&plus;%5Cgamma%20x_%7B1%7D%7D)

