# @param {Integer[]} tasks
# @param {Integer} session_time
# @return {Integer}
def min_sessions(tasks, session_time)
    tasks.sort! { |a, b| b <=> a }
    
    feasibility = ->(n) {
        sessions = Array.new(n, 0)
        
        dfs = nil
        dfs = ->(i) {
            return false if sessions.max > session_time
            return true if i == tasks.length
            
            (0...n).each do |s|
                sessions[s] += tasks[i]
                return true if dfs.call(i+1)
                sessions[s] -= tasks[i]
                return false if sessions[s] == 0
            end
            false
        }
        
        dfs.call(0)
    }
    
    lo, hi = 1, tasks.length
    res = hi
    while lo <= hi
        mid = (lo + hi) / 2
        if feasibility.call(mid)
            res = mid
            hi = mid - 1
        else
            lo = mid + 1
        end
    end
    res
end
