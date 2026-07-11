class Solution {
  int mincostTickets(List<int> days, List<int> costs) {
    int n = days.length;
    int left7 = 0;
    int left30 = 0;
    List<int> dp = List.filled(n, 0);
    
    for (int right = 0; right < n; right++) {
      while (days[right] - days[left7] >= 7) {
        left7++;
      }
      while (days[right] - days[left30] >= 30) {
        left30++;
      }
      
      int cost1 = (right > 0 ? dp[right - 1] : 0) + costs[0];
      int cost7 = (left7 > 0 ? dp[left7 - 1] : 0) + costs[1];
      int cost30 = (left30 > 0 ? dp[left30 - 1] : 0) + costs[2];
      
      dp[right] = [cost1, cost7, cost30].reduce((a, b) => a < b ? a : b);
    }
    
    return dp[n - 1];
  }
}
