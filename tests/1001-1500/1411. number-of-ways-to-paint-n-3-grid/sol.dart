class Solution {
  int numOfWays(int n) {
    const MOD = 1000000007;
    int x = 6, y = 6;
    
    for (int i = 2; i <= n; i++) {
      int newX = (3 * x + 2 * y) % MOD;
      int newY = (2 * x + 2 * y) % MOD;
      x = newX;
      y = newY;
    }
    
    return (x + y) % MOD;
  }
}
