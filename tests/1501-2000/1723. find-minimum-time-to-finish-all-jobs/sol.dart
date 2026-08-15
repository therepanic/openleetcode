class Solution {
  int minimumTimeRequired(List<int> jobs, int k) {
    jobs.sort((a, b) => b.compareTo(a));
    int left = jobs[0];
    int right = jobs.fold(0, (sum, j) => sum + j);
    
    bool canDistribute(int maxWorkload) {
      List<int> workers = List.filled(k, 0);
      
      bool assignJob(int jobIndex) {
        if (jobIndex == jobs.length) return true;
        for (int i = 0; i < k; i++) {
          if (workers[i] + jobs[jobIndex] <= maxWorkload) {
            workers[i] += jobs[jobIndex];
            if (assignJob(jobIndex + 1)) return true;
            workers[i] -= jobs[jobIndex];
          }
          if (workers[i] == 0) break;
        }
        return false;
      }
      
      return assignJob(0);
    }
    
    while (left < right) {
      int mid = (left + right) ~/ 2;
      if (canDistribute(mid)) {
        right = mid;
      } else {
        left = mid + 1;
      }
    }
    return left;
  }
}
