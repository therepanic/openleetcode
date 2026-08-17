public class Solution {
    public int MinSessions(int[] tasks, int sessionTime) {
        Array.Sort(tasks, (a, b) => b.CompareTo(a));
        
        Func<int, bool> feasibility = (n) => {
            int[] sessions = new int[n];
            
            Func<int, bool> dfs = null;
            dfs = (i) => {
                foreach (int v in sessions) if (v > sessionTime) return false;
                if (i == tasks.Length) return true;
                
                for (int s = 0; s < n; s++) {
                    sessions[s] += tasks[i];
                    if (dfs(i+1)) return true;
                    sessions[s] -= tasks[i];
                    if (sessions[s] == 0) return false;
                }
                return false;
            };
            
            return dfs(0);
        };
        
        int lo = 1, hi = tasks.Length;
        int res = hi;
        while (lo <= hi) {
            int mid = (lo + hi) / 2;
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
