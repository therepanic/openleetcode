function solveEquation(equation: string): string {
  const [left, right] = equation.split("=");

  function parseSide(side: string): [number, number] {
    let coeff = 0;
    let constant = 0;
    let num = "";
    let sign = 1;
    side += "+";

    for (const char of side) {
      if (char === "+" || char === "-") {
        if (num.length > 0) {
          constant += sign * parseInt(num);
          num = "";
        }
        sign = char === "+" ? 1 : -1;
      } else if (/^\d$/.test(char)) {
        num += char;
      } else if (char === "x") {
        coeff += sign * (num.length > 0 ? parseInt(num) : 1);
        num = "";
      }
    }
    return [coeff, constant];
  }

  const [leftCoeff, leftConst] = parseSide(left);
  const [rightCoeff, rightConst] = parseSide(right);

  const coeff = leftCoeff - rightCoeff;
  const constant = rightConst - leftConst;

  if (coeff === 0) {
    return constant !== 0 ? "No solution" : "Infinite solutions";
  }
  return `x=${Math.floor(constant / coeff)}`;
}
