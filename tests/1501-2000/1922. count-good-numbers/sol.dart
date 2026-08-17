class Solution {
  int countGoodNumbers(int n) {
    const int mod = 1000000007;
    int evenPositions = (n + 1) ~/ 2;
    int oddPositions = n ~/ 2;
    
    int evenWays = chakraPower(5, evenPositions, mod);
    int oddWays = chakraPower(4, oddPositions, mod);
    
    return (evenWays * oddWays) % mod;
  }
  
  int chakraPower(int base, int power, int mod) {
    int result = 1;
    int b = base % mod;
    int p = power;
    while (p > 0) {
      if (p % 2 == 1) {
        result = (result * b) % mod;
      }
      b = (b * b) % mod;
      p ~/= 2;
    }
    return result;
  }
}
