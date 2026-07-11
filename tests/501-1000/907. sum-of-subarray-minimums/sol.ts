function sumSubarrayMins(arr: number[]): number {
  const MOD = 1_000_000_007;
  const n = arr.length;
  const stack: number[] = [];
  const res: number[] = new Array(n).fill(0);
  for (let i = 0; i < n; i++) {
    while (stack.length > 0 && arr[stack[stack.length - 1]] > arr[i]) {
      stack.pop();
    }
    const j = stack.length > 0 ? stack[stack.length - 1] : -1;
    res[i] = ((j >= 0 ? res[j] : 0) + (i - j) * arr[i]) % MOD;
    stack.push(i);
  }
  return res.reduce((a, b) => (a + b) % MOD, 0);
}
