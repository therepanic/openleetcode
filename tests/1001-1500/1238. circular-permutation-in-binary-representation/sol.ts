function circularPermutation(n: number, start: number): number[] {
  const result: number[] = [];
  for (let i = 0; i < 1 << n; i++) {
    result.push(start ^ (i ^ (i >> 1)));
  }
  return result;
}
