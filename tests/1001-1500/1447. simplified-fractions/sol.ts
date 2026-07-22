function simplifiedFractions(n: number): string[] {
  const fractions: string[] = [];
  for (let numerator = 1; numerator < n; numerator++) {
    for (let denominator = numerator + 1; denominator <= n; denominator++) {
      if (gcd(numerator, denominator) === 1) {
        fractions.push(`${numerator}/${denominator}`);
      }
    }
  }
  return fractions;
}

function gcd(a: number, b: number): number {
  while (b !== 0) {
    [a, b] = [b, a % b];
  }
  return a;
}
