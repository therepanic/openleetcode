function countVowelStrings(n: number): number {
  if (n === 1) {
    return 5;
  } else if (n === 2) {
    return 15;
  } else if (n === 3) {
    return 35;
  }
  const x: number[] = new Array(n - 2).fill(0);
  x[0] = 10;
  let c = 5;
  for (let i = 0; i < n - 3; i++) {
    x[i + 1] = x[i] + c;
    c++;
  }
  const y: number[] = new Array(n - 1).fill(0);
  y[0] = 10;
  for (let i = 0; i < n - 2; i++) {
    y[i + 1] = y[i] + x[i];
  }
  let sum = y.reduce((a, b) => a + b, 0);
  return sum + 5;
}
