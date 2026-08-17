class Solution {
  int minSessions(List<int> tasks, int sessionTime) {
    tasks.sort((a, b) => b.compareTo(a));
    
    bool feasibility(int n) {
      List<int> sessions = List.filled(n, 0);
      
      bool dfs(int i) {
        for (int v in sessions) {
          if (v > sessionTime) return false;
        }
        if (i == tasks.length) return true;
        
        for (int s = 0; s < n; s++) {
          sessions[s] += tasks[i];
          if (dfs(i+1)) return true;
          sessions[s] -= tasks[i];
          if (sessions[s] == 0) return false;
        }
        return false;
      }
      
      return dfs(0);
    }
    
    int lo = 1, hi = tasks.length;
    int res = hi;
    while (lo <= hi) {
      int mid = (lo + hi) ~/ 2;
      if (feasibility(mid)) {
        res = mid;
        hi = mid - 1;
      } else {
        lo = mid + 1;
      }
    }
    return res;
  }
}
