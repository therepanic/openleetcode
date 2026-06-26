function complexNumberMultiply(num1: string, num2: string): string {
  const parseComplex = (s: string): [number, number] => {
    const parts = s.split("+");
    const real = parseInt(parts[0]);
    const imag = parseInt(parts[1].slice(0, -1));
    return [real, imag];
  };

  const [a, b] = parseComplex(num1);
  const [c, d] = parseComplex(num2);
  const realPart = a * c - b * d;
  const imagPart = a * d + b * c;
  return `${realPart}+${imagPart}i`;
}
