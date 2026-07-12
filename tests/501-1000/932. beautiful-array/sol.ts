function beautifulArray(n: number): number[] {
  if (n === 1) {
    return [1];
  }

  const left = beautifulArray(Math.ceil(n / 2));
  const right = beautifulArray(Math.floor(n / 2));

  const result: number[] = [];

  for (const x of left) {
    result.push(2 * x - 1);
  }
  for (const x of right) {
    result.push(2 * x);
  }

  return result;
}
