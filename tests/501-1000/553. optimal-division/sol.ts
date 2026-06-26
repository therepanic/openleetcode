function optimalDivision(nums: number[]): string {
  let result = nums[0].toString();

  if (nums.length === 1) {
    return result;
  }

  if (nums.length === 2) {
    return result + "/" + nums[1].toString();
  }

  result += "/(" + nums[1].toString();
  for (let i = 2; i < nums.length; i++) {
    result += "/" + nums[i].toString();
  }

  return result + ")";
}
