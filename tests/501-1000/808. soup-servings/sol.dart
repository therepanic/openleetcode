class Solution {
  double soupServings(int n) {
    if (n > 5000) {
      return 1.0;
    }
    int units = (n / 25).ceil();
    Map<String, double> memo = {};
    
    double calcProb(int soupA, int soupB) {
      String key = '$soupA,$soupB';
      if (memo.containsKey(key)) {
        return memo[key]!;
      }
      if (soupA <= 0 && soupB <= 0) {
        return 0.5;
      }
      if (soupA <= 0) {
        return 1.0;
      }
      if (soupB <= 0) {
        return 0.0;
      }
      double result = 0.25 * (
          calcProb(soupA - 4, soupB) +
          calcProb(soupA - 3, soupB - 1) +
          calcProb(soupA - 2, soupB - 2) +
          calcProb(soupA - 1, soupB - 3));
      memo[key] = result;
      return result;
    }
    
    return calcProb(units, units);
  }
}
