function fractionToDecimal(numerator: number, denominator: number): string {
  if (numerator === 0) return "0";
  let result = "";
  let n = numerator;
  let d = denominator;
  if (n < 0 !== d < 0) result += "-";
  n = Math.abs(n);
  d = Math.abs(d);
  result += Math.floor(n / d).toString();
  let rem = n % d;
  if (rem === 0) return result;
  result += ".";
  const seen = new Map<number, number>();
  while (rem !== 0) {
    const idx = seen.get(rem);
    if (idx !== undefined) {
      return result.slice(0, idx) + "(" + result.slice(idx) + ")";
    }
    seen.set(rem, result.length);
    rem *= 10;
    result += Math.floor(rem / d).toString();
    rem %= d;
  }
  return result;
}
