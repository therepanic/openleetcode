class Solution {
  int maxTaxiEarnings(int n, List<List<int>> rides) {
    rides.sort((a, b) => a[1].compareTo(b[1]));
    List<List<int>> dp = [[0, 0]];
    
    for (var ride in rides) {
      int start = ride[0], end = ride[1], tip = ride[2];
      
      int lo = 0, hi = dp.length;
      while (lo < hi) {
        int mid = lo + (hi - lo) ~/ 2;
        if (dp[mid][0] <= start) {
          lo = mid + 1;
        } else {
          hi = mid;
        }
      }
      int i = lo - 1;
      int profit = dp[i][1] + end - start + tip;
      
      if (profit > dp.last[1]) {
        dp.add([end, profit]);
      }
    }
    
    return dp.last[1];
  }
}
