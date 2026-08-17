function reinitializePermutation(n: number): number {
  const original: number[] = Array.from({ length: n }, (_, i) => i);
  let permut: number[] = [...original];
  const arr: number[] = new Array(n).fill(0);
  let count = 0;
  while (true) {
    for (let i = 0; i < n; i++) {
      if (i % 2 === 0) {
        arr[i] = permut[Math.floor(i / 2)];
      } else {
        arr[i] = permut[Math.floor(n / 2) + Math.floor((i - 1) / 2)];
      }
    }
    permut = [...arr];
    count++;
    let equal = true;
    for (let i = 0; i < n; i++) {
      if (permut[i] !== original[i]) {
        equal = false;
        break;
      }
    }
    if (equal) break;
  }
  return count;
}
