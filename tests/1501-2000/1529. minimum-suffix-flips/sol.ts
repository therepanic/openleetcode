function minFlips(target: string): number {
  let minCount = 0;
  let flag = 0;
  const n = target.length;

  for (let i = 0; i < n; i++) {
    const expected = String.fromCharCode(48 + (flag % 2));
    if (target[i] !== expected) {
      minCount++;
      flag++;
    }
  }

  return minCount;
}
