function maximumUniqueSubarray(nums: number[]): number {
  let res = 0;
  let curSum = 0;
  let start = 0;
  const k = 10001;
  const isPresent: boolean[] = new Array(k).fill(false);

  for (let end = 0; end < nums.length; end++) {
    while (isPresent[nums[end]]) {
      isPresent[nums[start]] = false;
      curSum -= nums[start];
      start++;
    }

    isPresent[nums[end]] = true;
    curSum += nums[end];

    res = Math.max(res, curSum);
  }

  return res;
}
