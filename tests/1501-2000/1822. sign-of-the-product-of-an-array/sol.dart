class Solution {
  int arraySign(List<int> nums) {
    if (nums.contains(0)) return 0;
    int negatives = 0;
    for (int num in nums) if (num < 0) negatives++;
    return negatives.isEven ? 1 : -1;
  }
}
