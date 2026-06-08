function multiply(num1: string, num2: string): string {
  const n = num1.length;
  const m = num2.length;
  const result = Array(n + m).fill(0);

  for (let i = n - 1; i >= 0; i--) {
    for (let j = m - 1; j >= 0; j--) {
      const mul = (num1.charCodeAt(i) - 48) * (num2.charCodeAt(j) - 48);
      const sum = mul + result[i + j + 1];
      result[i + j + 1] = sum % 10;
      result[i + j] += Math.floor(sum / 10);
    }
  }

  let k = 0;
  while (k < result.length && result[k] === 0) {
    k++;
  }
  if (k === result.length) {
    return "0";
  }

  return result.slice(k).join("");
}
