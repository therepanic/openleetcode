function maxDistance(arrays: number[][]): number {
  let smallest = arrays[0][0];
  let largest = arrays[0][arrays[0].length - 1];
  let ans = 0;
  for (let i = 1; i < arrays.length; i++) {
    const curMin = arrays[i][0];
    const curMax = arrays[i][arrays[i].length - 1];
    ans = Math.max(ans, largest - curMin, curMax - smallest);
    smallest = Math.min(curMin, smallest);
    largest = Math.max(curMax, largest);
  }
  return ans;
}
