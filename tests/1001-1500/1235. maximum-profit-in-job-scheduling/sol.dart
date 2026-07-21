class Solution {
  int jobScheduling(List<int> startTime, List<int> endTime, List<int> profit) {
    int n = startTime.length;
    List<List<int>> jobs = List.generate(n, (i) => [startTime[i], endTime[i], profit[i]]);
    jobs.sort((a, b) => a[0].compareTo(b[0]));
    
    List<int> starts = jobs.map((j) => j[0]).toList();
    List<int> dp = List.filled(n + 1, 0);
    
    int binarySearch(List<int> arr, int target, int left) {
      int lo = left, hi = arr.length;
      while (lo < hi) {
        int mid = lo + (hi - lo) ~/ 2;
        if (arr[mid] >= target) {
          hi = mid;
        } else {
          lo = mid + 1;
        }
      }
      return lo;
    }
    
    for (int i = n - 1; i >= 0; i--) {
      int idx = binarySearch(starts, jobs[i][1], i + 1);
      int take = jobs[i][2] + dp[idx];
      int notTake = dp[i + 1];
      dp[i] = take > notTake ? take : notTake;
    }
    return dp[0];
  }
}
