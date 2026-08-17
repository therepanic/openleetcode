class Solution {
  int minOperations(List<int> nums) {
    int length = nums.length;
    int minOps = length;
    List<int> uniqueNums = nums.toSet().toList()..sort();
    int right = 0;
    
    for (int left = 0; left < uniqueNums.length; left++) {
      while (right < uniqueNums.length && uniqueNums[right] < uniqueNums[left] + length) {
        right++;
      }
      
      minOps = minOps < length - (right - left) ? minOps : length - (right - left);
    }
    
    return minOps;
  }
}
