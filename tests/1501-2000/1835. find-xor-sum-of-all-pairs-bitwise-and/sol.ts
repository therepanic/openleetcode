function getXORSum(arr1: number[], arr2: number[]): number {
  let x = 0,
    y = 0;
  for (const v of arr1) {
    x ^= v;
  }
  for (const v of arr2) {
    y ^= v;
  }
  return x & y;
}
