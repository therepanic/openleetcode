class Solution {
  int countDifferentSubsequenceGCDs(List<int> nums) {
    Set<int> seen = nums.toSet();
    int maxi = nums.reduce((a, b) => a > b ? a : b);
    int cnt = 0;
    for (int i = 1; i <= maxi; i++) {
      int gd = 0;
      for (int j = i; j <= maxi; j += i) {
        if (seen.contains(j)) {
          gd = _gcd(gd, j);
        }
      }
      if (gd == i) cnt++;
    }
    return cnt;
  }
  
  int _gcd(int a, int b) {
    while (b != 0) {
      int temp = a % b;
      a = b;
      b = temp;
    }
    return a;
  }
}
