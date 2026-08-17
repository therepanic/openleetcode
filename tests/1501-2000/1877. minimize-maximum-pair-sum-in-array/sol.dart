class Solution {
  int minPairSum(List<int> nums) {
    nums.sort();
    int answer = 0;
    int left = 0;
    int right = nums.length - 1;
    while (left < right) {
      final sum = nums[left] + nums[right];
      if (sum > answer) answer = sum;
      left++;
      right--;
    }
    return answer;
  }
}
