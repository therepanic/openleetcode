class Solution {
  int findNumbers(List<int> nums) {
    int count = 0;
    for (int i in nums) {
      if (i.toString().length % 2 == 0) {
        count++;
      }
    }
    return count;
  }
}
