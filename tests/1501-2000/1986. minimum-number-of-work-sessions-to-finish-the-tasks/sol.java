import java.util.*;

class Solution {
    public int minSessions(int[] tasks, int sessionTime) {
        Integer[] arr = Arrays.stream(tasks).boxed().toArray(Integer[]::new);
        Arrays.sort(arr, Collections.reverseOrder());
        int[] sorted = Arrays.stream(arr).mapToInt(Integer::intValue).toArray();
        tasks = sorted;
        
        int lo = 1, hi = tasks.length;
        int res = hi;
        while (lo <= hi) {
            int mid = (lo + hi) / 2;
            if (feasibility(tasks, sessionTime, mid)) {
                res = mid;
                hi = mid - 1;
            } else {
                lo = mid + 1;
            }
        }
        return res;
    }
    
    private boolean feasibility(int[] tasks, int sessionTime, int n) {
        int[] sessions = new int[n];
        return dfs(tasks, sessionTime, 0, sessions);
    }
    
    private boolean dfs(int[] tasks, int sessionTime, int i, int[] sessions) {
        for (int v : sessions) if (v > sessionTime) return false;
        if (i == tasks.length) return true;
        
        for (int s = 0; s < sessions.length; s++) {
            sessions[s] += tasks[i];
            if (dfs(tasks, sessionTime, i+1, sessions)) return true;
            sessions[s] -= tasks[i];
            if (sessions[s] == 0) return false;
        }
        return false;
    }
}
