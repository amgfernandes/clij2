
__kernel void find_n_closest_points(
DTYPE_IMAGE_IN_2D src_distancematrix,
DTYPE_IMAGE_OUT_2D dst_indexlist) {
  const sampler_t sampler = CLK_NORMALIZED_COORDS_FALSE | CLK_ADDRESS_CLAMP_TO_EDGE | CLK_FILTER_NEAREST;

  const int pointIndex = get_global_id(0);

  // so many point candidates are available:
  const int height = GET_IMAGE_HEIGHT(src_distancematrix);

  // so many minima need to be found:
  const int n = GET_IMAGE_HEIGHT(dst_indexlist);

  float distances[1000];
  float indices[1000];

  int initialized_values = 0;

  int2 pos = (int2){pointIndex, 0};
  for (int y = 0; y < height; y++) {
    pos.y = y;
    float distance = READ_IMAGE_2D(src_distancematrix, sampler, pos).x;

    if (initialized_values < n) {
      initialized_values++;
      distances[initialized_values - 1] = distance;
      indices[initialized_values - 1] = y;
    }
    // sort by insert
    for (int i = initialized_values - 1; i >= 0; i--) {
        if (distance > distances[i]) {
            break;
        }
        if (distance < distances[i] && (i == 0 || distance >= distances[i - 1])) {
           for (int j = initialized_values - 1; j > i; j--) {
                indices[j] = indices[j - 1];
                distances[j] = distances[j - 1];
           }
           distances[i] = distance;
           indices[i] = y;
           break;
        }
    }
  }

  for (int i = 0; i < initialized_values; i++) {
    pos.y = i;

    WRITE_IMAGE_2D(dst_indexlist, pos, CONVERT_DTYPE_OUT(indices[i]));
  }
}