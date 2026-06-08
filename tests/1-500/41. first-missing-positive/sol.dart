class Solution {
  int firstMissingPositive(List<int> nums) {
    final seen = nums.toSet();
    var i = 1;
    while (seen.contains(i)) {
      i++;
    }
    return i;
  }
}
