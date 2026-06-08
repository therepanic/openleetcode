function getPermutation(n: number, k: number): string {
  const nums: number[] = [];
  const factorial = Array(n + 1).fill(1);

  for (let i = 1; i <= n; i++) {
    nums.push(i);
    factorial[i] = factorial[i - 1] * i;
  }

  k--;
  let res = "";
  for (let remaining = n; remaining >= 1; remaining--) {
    const block = factorial[remaining - 1];
    const idx = Math.floor(k / block);
    k %= block;
    res += String(nums[idx]);
    nums.splice(idx, 1);
  }
  return res;
}
