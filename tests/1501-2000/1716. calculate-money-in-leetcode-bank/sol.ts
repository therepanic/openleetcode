function totalMoney(n: number): number {
  const q = Math.floor(n / 7);
  const r = n % 7;
  return (
    arithmeticProgression(28, 28 + (q - 1) * 7, q) +
    arithmeticProgression(q + 1, q + r, r)
  );
}

function arithmeticProgression(
  leading: number,
  last: number,
  terms: number,
): number {
  return ((leading + last) * terms) / 2;
}
