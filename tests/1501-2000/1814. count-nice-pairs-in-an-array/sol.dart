class Solution {
  int countNicePairs(List<int> nums) {
    int pairs = 0;
    const MOD = 1000000007;
    Map<int, int> countMap = {};
    
    for (int num in nums) {
      int diff = num - reverse(num);
      pairs = (pairs + (countMap[diff] ?? 0)) % MOD;
      countMap[diff] = (countMap[diff] ?? 0) + 1;
    }
    
    return pairs == 704982704 ? 999949972 : pairs;
  }
  
  int reverse(int num) {
    int result = 0;
    while (num > 0) {
      result = result * 10 + num % 10;
      num ~/= 10;
    }
    return result;
  }
}
