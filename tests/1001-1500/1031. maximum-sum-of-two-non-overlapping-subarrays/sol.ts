function maxSumTwoNoOverlap(
  nums: number[],
  firstLen: number,
  secondLen: number,
): number {
  return Math.max(
    solve(nums, firstLen, secondLen),
    solve(nums, secondLen, firstLen),
  );
}

function solve(nums: number[], firstLen: number, secondLen: number): number {
  const n = nums.length;
  const prefix: number[] = new Array(n + 1).fill(0);
  for (let i = 0; i < n; i++) {
    prefix[i + 1] = prefix[i] + nums[i];
  }
  let bestA = prefix[firstLen];
  let ans = 0;
  for (let end = firstLen + secondLen; end <= n; end++) {
    bestA = Math.max(
      bestA,
      prefix[end - secondLen] - prefix[end - secondLen - firstLen],
    );
    ans = Math.max(ans, bestA + prefix[end] - prefix[end - secondLen]);
  }
  return ans;
}
