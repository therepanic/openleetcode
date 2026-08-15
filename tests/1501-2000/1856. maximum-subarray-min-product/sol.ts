function maxSumMinProduct(nums: number[]): number {
  const n = nums.length;
  const prefix: number[] = new Array(n + 1).fill(0);
  for (let i = 0; i < n; i++) prefix[i + 1] = prefix[i] + nums[i];

  const leftBound: number[] = new Array(n).fill(-1);
  const rightBound: number[] = new Array(n).fill(n);
  let stack: number[] = [];
  for (let i = 0; i < n; i++) {
    while (stack.length && nums[stack[stack.length - 1]] > nums[i]) {
      rightBound[stack.pop()!] = i;
    }
    stack.push(i);
  }
  stack = [];
  for (let i = n - 1; i >= 0; i--) {
    while (stack.length && nums[stack[stack.length - 1]] > nums[i]) {
      leftBound[stack.pop()!] = i;
    }
    stack.push(i);
  }

  let maxProd = 0n;
  for (let i = 0; i < n; i++) {
    const l = leftBound[i],
      r = rightBound[i];
    const total = prefix[r] - prefix[l + 1];
    const prod = BigInt(nums[i]) * BigInt(total);
    if (prod > maxProd) maxProd = prod;
  }
  return Number(maxProd % 1000000007n);
}
