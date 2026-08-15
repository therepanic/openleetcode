class Solution {
  int numWays(String s) {
    const MOD = 1000000007;
    int totalOnes = s.split('').where((c) => c == '1').length;
    
    if (totalOnes == 0) {
      int n = s.length;
      return ((n - 1) * (n - 2) ~/ 2) % MOD;
    }
    
    if (totalOnes % 3 != 0) return 0;
    
    int onesPerPart = totalOnes ~/ 3;
    int firstSplitWays = 0, secondSplitWays = 0, count = 0;
    
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '1') count++;
      if (count == onesPerPart) {
        firstSplitWays++;
      } else if (count == 2 * onesPerPart) {
        secondSplitWays++;
      }
    }
    
    return (firstSplitWays * secondSplitWays) % MOD;
  }
}
