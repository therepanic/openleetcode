function decrypt(code: number[], k: number): number[] {
  const n = code.length;
  const result: number[] = new Array(n).fill(0);

  if (k === 0) return result;

  const window = Math.abs(k);
  let total = 0;

  let start = k > 0 ? 1 : n - window;
  let end = k > 0 ? window : n - 1;

  for (let i = start; i <= end; i++) {
    total += code[i % n];
  }
  for (let i = 0; i < n; i++) {
    result[i] = total;

    total -= code[start % n];
    start++;

    end++;
    total += code[end % n];
  }
  return result;
}
