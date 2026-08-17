class Solution {
  int findGCD(List<int> nums) {
    int a = nums.reduce((x, y) => x < y ? x : y);
    int b = nums.reduce((x, y) => x > y ? x : y);
    return _gcd(a, b);
  }
  
  int _gcd(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }
}
