class Solution {
  bool xorGame(List<int> nums) {
    int totalXor = 0;
    for (int value in nums) {
      totalXor ^= value;
    }
    
    bool isXorZero = (totalXor == 0);
    bool hasEvenLength = (nums.length % 2 == 0);
    
    return isXorZero || hasEvenLength;
  }
}
