class Solution {
  int maxProfitAssignment(List<int> difficulty, List<int> profit, List<int> worker) {
    int n = difficulty.length;
    List<List<int>> jobs = List.generate(n, (i) => [difficulty[i], profit[i]]);
    jobs.sort((a, b) => a[0].compareTo(b[0]));
    worker.sort();
    int ans = 0, best = 0, i = 0;
    for (int ability in worker) {
      while (i < n && jobs[i][0] <= ability) {
        best = best > jobs[i][1] ? best : jobs[i][1];
        i++;
      }
      ans += best;
    }
    return ans;
  }
}
