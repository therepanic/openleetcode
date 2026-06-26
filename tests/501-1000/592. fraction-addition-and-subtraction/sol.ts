function fractionAddition(expression: string): string {
  function gcd(a: number, b: number): number {
    while (b !== 0) {
      const temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  const fractions: [number, number][] = [];
  let i = 0;
  while (i < expression.length) {
    let sign: string;
    if (expression[i] === "+" || expression[i] === "-") {
      sign = expression[i];
      i++;
    } else {
      sign = "+";
    }
    let numerator = 0;
    while (
      i < expression.length &&
      expression[i] >= "0" &&
      expression[i] <= "9"
    ) {
      numerator = numerator * 10 + parseInt(expression[i]);
      i++;
    }
    i++; // skip '/'
    let denominator = 0;
    while (
      i < expression.length &&
      expression[i] >= "0" &&
      expression[i] <= "9"
    ) {
      denominator = denominator * 10 + parseInt(expression[i]);
      i++;
    }
    if (sign === "-") {
      numerator = -numerator;
    }
    fractions.push([numerator, denominator]);
  }

  let commonDenominator = 1;
  for (const [, den] of fractions) {
    commonDenominator *= den / gcd(commonDenominator, den);
  }

  let totalNumerator = 0;
  for (const [num, den] of fractions) {
    totalNumerator += num * (commonDenominator / den);
  }

  const gcdResult = gcd(Math.abs(totalNumerator), commonDenominator);
  totalNumerator /= gcdResult;
  commonDenominator /= gcdResult;

  return `${totalNumerator}/${commonDenominator}`;
}
