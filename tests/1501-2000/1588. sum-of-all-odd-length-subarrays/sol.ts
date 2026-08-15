function sumOddLengthSubarrays(arr: number[]): number {
  let s = arr.reduce((a, b) => a + b, 0);
  let l = arr.length - 1;
  let i = 2;
  while (l >= i) {
    let j = 0;
    let e = i;
    while (e <= l) {
      for (let k = j; k <= e; k++) {
        s += arr[k];
      }
      j++;
      e++;
    }
    i += 2;
  }
  return s;
}
