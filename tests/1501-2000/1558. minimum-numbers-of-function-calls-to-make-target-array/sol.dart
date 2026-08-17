class Solution {
  int minOperations(List<int> nums) {
    int sumBits = 0;
    int maxNum = 0;
    for (int num in nums) {
      sumBits += num.toRadixString(2).replaceAll('0', '').length;
      if (num > maxNum) {
        maxNum = num;
      }
    }
    int doubling = maxNum > 0 ? maxNum.toRadixString(2).length - 1 : 0;
    return sumBits + doubling;
  }
}
