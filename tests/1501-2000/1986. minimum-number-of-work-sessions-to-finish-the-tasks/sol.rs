impl Solution {
    pub fn min_sessions(tasks: Vec<i32>, session_time: i32) -> i32 {
        let mut tasks = tasks;
        tasks.sort_by(|a, b| b.cmp(a));
        
        fn feasibility(tasks: &Vec<i32>, session_time: i32, n: usize) -> bool {
            let mut sessions = vec![0i32; n];
            
            fn dfs(tasks: &Vec<i32>, session_time: i32, i: usize, sessions: &mut Vec<i32>) -> bool {
                if sessions.iter().any(|&v| v > session_time) { return false; }
                if i == tasks.len() { return true; }
                
                for s in 0..sessions.len() {
                    sessions[s] += tasks[i];
                    if dfs(tasks, session_time, i+1, sessions) { return true; }
                    sessions[s] -= tasks[i];
                    if sessions[s] == 0 { return false; }
                }
                false
            }
            
            dfs(tasks, session_time, 0, &mut sessions)
        }
        
        let mut lo = 1usize;
        let mut hi = tasks.len();
        let mut res = hi as i32;
        while lo <= hi {
            let mid = (lo + hi) / 2;
            if feasibility(&tasks, session_time, mid) {
                res = mid as i32;
                hi = mid - 1;
            } else {
                lo = mid + 1;
            }
        }
        res
    }
}
