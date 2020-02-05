// This script shows how generate a maximum Z projection using CLIJ and javascript.
//
// Author: Robert Haase (@haesleinhuepf)
// April 2019
//

////////////////////////////////////////
importClass(Packages.ij.IJ);
importClass(Packages.net.haesleinhuepf.clij2.CLIJ2);

IJ.run("Close All");

// Init GPU
clij2 = CLIJ2.getInstance();

// get some example data
imp = IJ.openImage("http://imagej.nih.gov/ij/images/t1-head.zip");

// create and fill memory in GPU
imageInput = clij2.push(imp);
dimensions = [imageInput.getWidth(), imageInput.getHeight()];
imageOutput = clij2.create(dimensions, imageInput.getNativeType());

// process the image
clij2.maximumZProjection(imageInput, imageOutput);

// show the result
clij2.show(imageOutput, "output");

// get the result back as variable
result = clij2.pull(imageOutput);

IJ.run("Enhance Contrast", "saturated=0.35");
