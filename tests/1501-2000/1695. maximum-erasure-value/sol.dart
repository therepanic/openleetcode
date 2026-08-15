class Solution {
  int maximumUniqueSubarray(List<int> nums) {
    int res = 0;
    int curSum = 0;
    int start = 0;
    final k = 10001;
    List<bool> isPresent = List.filled(k, false);

    for (int end = 0; end < nums.length; end++) {
      while (isPresent[nums[end]]) {
        isPresent[nums[start]] = false;
        curSum -= nums[start];
        start++;
      }

      isPresent[nums[end]] = true;
      curSum += nums[end];

      if (curSum > res) {
        res = curSum;
      }
    }

    return res;
  }
}
