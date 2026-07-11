impl Solution {
    pub fn super_egg_drop(k: i32, n: i32) -> i32 {
        let k = k as usize;
        let n = n as usize;
        let mut memo = vec![vec![-1; n + 1]; k + 1];
        
        fn solve(eggs: usize, floors: usize, memo: &mut Vec<Vec<i32>>) -> i32 {
            if floors <= 1 || eggs == 1 {
                return floors as i32;
            }
            if memo[eggs][floors] != -1 {
                return memo[eggs][floors];
            }
            
            let mut low = 1;
            let mut high = floors;
            let mut ans = floors as i32;
            
            while low <= high {
                let mid = (low + high) / 2;
                let break_case = solve(eggs - 1, mid - 1, memo);
                let not_break_case = solve(eggs, floors - mid, memo);
                
                ans = ans.min(1 + break_case.max(not_break_case));
                if break_case < not_break_case {
                    low = mid + 1;
                } else {
                    high = mid - 1;
                }
            }
            
            memo[eggs][floors] = ans;
            ans
        }
        
        solve(k, n, &mut memo)
    }
}
