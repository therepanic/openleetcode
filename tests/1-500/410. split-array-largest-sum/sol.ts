function splitArray(nums: number[], k: number): number {
  const helper = (perK: number): boolean => {
    let count = 1;
    let currSum = 0;
    for (const num of nums) {
      if (currSum + num > perK) {
        count++;
        currSum = num;
      } else {
        currSum += num;
      }
    }
    return count <= k;
  };

  let high = nums.reduce((a, b) => a + b, 0);
  let low = Math.max(...nums);
  let soln = 0;
  while (low <= high) {
    const mid = low + Math.floor((high - low) / 2);
    if (helper(mid)) {
      soln = mid;
      high = mid - 1;
    } else {
      low = mid + 1;
    }
  }
  return soln;
}
