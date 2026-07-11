function numSquarefulPerms(nums: number[]): number {
  const n = nums.length;
  nums.sort((a, b) => a - b);

  const isSquareful = (currNums: number[], num: number): boolean => {
    if (currNums.length === 0) return true;
    const prevNum = currNums[currNums.length - 1];
    const pairSum = prevNum + num;
    if (pairSum < 0) return false;
    const sqrtN = Math.floor(Math.sqrt(pairSum));
    return sqrtN * sqrtN === pairSum;
  };

  const backtrack = (numsMask: number, currNums: number[]): number => {
    if (numsMask !== 0 && currNums.length === n) return 1;
    let numSquarefulPerms = 0;
    for (let idx = 0; idx < n; idx++) {
      const num = nums[idx];
      if (
        idx > 0 &&
        nums[idx] === nums[idx - 1] &&
        (numsMask & (1 << (idx - 1))) === 0
      ) {
        continue;
      }
      if ((numsMask & (1 << idx)) === 0 && isSquareful(currNums, num)) {
        currNums.push(num);
        numSquarefulPerms += backtrack(numsMask | (1 << idx), currNums);
        currNums.pop();
      }
    }
    return numSquarefulPerms;
  };

  return backtrack(0, []);
}
