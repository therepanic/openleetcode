class Solution {
public:
    int minSessions(vector<int>& tasks, int sessionTime) {
        sort(tasks.rbegin(), tasks.rend());
        
        auto feasibility = [&](int n) -> bool {
            vector<int> sessions(n, 0);
            
            function<bool(int)> dfs = [&](int i) -> bool {
                for (int v : sessions) if (v > sessionTime) return false;
                if (i == (int)tasks.size()) return true;
                
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
        
        int lo = 1, hi = tasks.size();
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
};
