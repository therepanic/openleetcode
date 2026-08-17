class Solution {
    func minSessions(_ tasks: [Int], _ sessionTime: Int) -> Int {
        var tasks = tasks.sorted(by: >)
        
        func feasibility(_ n: Int) -> Bool {
            var sessions = [Int](repeating: 0, count: n)
            
            func dfs(_ i: Int) -> Bool {
                if sessions.max()! > sessionTime { return false }
                if i == tasks.count { return true }
                
                for s in 0..<n {
                    sessions[s] += tasks[i]
                    if dfs(i+1) { return true }
                    sessions[s] -= tasks[i]
                    if sessions[s] == 0 { return false }
                }
                return false
            }
            
            return dfs(0)
        }
        
        var lo = 1, hi = tasks.count
        var res = hi
        while lo <= hi {
            let mid = (lo + hi) / 2
            if feasibility(mid) {
                res = mid
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }
        return res
    }
}
