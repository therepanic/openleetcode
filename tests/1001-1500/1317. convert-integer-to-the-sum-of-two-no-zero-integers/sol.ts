function getNoZeroIntegers(n: number): number[] {
  for (let i = 1; i < n; i++) {
    if (!i.toString().includes("0") && !(n - i).toString().includes("0")) {
      return [i, n - i];
    }
  }
  return [];
}
