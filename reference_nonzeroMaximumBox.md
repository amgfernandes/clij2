## nonzeroMaximumBox
![Image](images/mini_clij2_logo.png)![Image](images/mini_clijx_logo.png)

Apply a maximum filter (box shape) to the input image. The radius is fixed to 1 and pixels with value 0 are ignored.

### Usage in ImageJ macro
```
Ext.CLIJx_nonzeroMaximumBox(Image input, Image destination);
```


### Usage in Java
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer arg1 = clij2.push(arg1ImagePlus);
ClearCLBuffer arg2 = clij2.push(arg2ImagePlus);
ClearCLBuffer arg3 = clij2.push(arg3ImagePlus);
```

```
// Execute operation on GPU
ClearCLKernel resultNonzeroMaximumBox = clij2.nonzeroMaximumBox(clij, arg1, arg2, arg3, arg4);
```

```
//show result
System.out.println(resultNonzeroMaximumBox);

// cleanup memory on GPU
clij2.release(arg1);
clij2.release(arg2);
clij2.release(arg3);
```


[Back to CLIJ documentation](https://clij.github.io/)

[Imprint](https://clij.github.io/imprint)
