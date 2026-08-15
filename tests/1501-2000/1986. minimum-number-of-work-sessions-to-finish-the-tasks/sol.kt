class Solution {
    fun minSessions(tasks: IntArray, sessionTime: Int): Int {
        tasks.sortDescending()
        
        fun feasibility(n: Int): Boolean {
            val sessions = IntArray(n)
            
            fun dfs(i: Int): Boolean {
                if (sessions.max()!! > sessionTime) return false
                if (i == tasks.size) return true
                
                for (s in 0 until n) {
                    sessions[s] += tasks[i]
                    if (dfs(i+1)) return true
                    sessions[s] -= tasks[i]
                    if (sessions[s] == 0) return false
                }
                return false
            }
            
            return dfs(0)
        }
        
        var lo = 1
        var hi = tasks.size
        var res = hi
        while (lo <= hi) {
            val mid = (lo + hi) / 2
            if (feasibility(mid)) {
                res = mid
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }
        return res
    }
}
