class Solution {
  int findMaxLength(List<int> nums) {
    int count = 0;
    int maxLength = 0;
    Map<int, int> countMap = {0: -1};

    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == 0) {
        count--;
      } else {
        count++;
      }

      if (countMap.containsKey(count)) {
        maxLength = max(maxLength, i - countMap[count]!);
      } else {
        countMap[count] = i;
      }
    }

    return maxLength;
  }
}
