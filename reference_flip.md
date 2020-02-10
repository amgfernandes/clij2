## flip
<img src="images/mini_empty_logo.png"/><img src="images/mini_empty_logo.png"/><img src="images/mini_empty_logo.png"/>

Flips an image in X and/or Y direction depending on boolean flags.

### Usage in ImageJ macro
```
Ext.CLIJx_flip(Image source, Image destination, Boolean flipX, Boolean flipY);
```


### Usage in Java
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer source = clij2.push(sourceImagePlus);
destination = clij.create(source);
boolean flipX = true;
boolean flipY = false;
```

```
// Execute operation on GPU
clij2.flip(clij, source, destination, flipX, flipY);
```

```
//show result
destinationImagePlus = clij2.pull(destination);
destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(source);
clij2.release(destination);
```




### Example scripts
<a href="https://github.com/clij/clij-advanced-filters/blob/master/src/main/macro/"><img src="images/language_macro.png" height="20"/></a> [flip.ijm](https://github.com/clij/clij-advanced-filters/blob/master/src/main/macro/flip.ijm)  
<a href="https://github.com/clij/clatlab/blob/master/src/main/matlab/"><img src="images/language_matlab.png" height="20"/></a> [flipImage.m](https://github.com/clij/clatlab/blob/master/src/main/matlab/flipImage.m)  


[Back to CLIJ documentation](https://clij.github.io/)

[Imprint](https://clij.github.io/imprint)
