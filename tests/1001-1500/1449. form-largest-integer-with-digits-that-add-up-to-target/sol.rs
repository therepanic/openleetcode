impl Solution {
    pub fn largest_number(cost: Vec<i32>, target: i32) -> String {
        let n = cost.len();
        let target = target as usize;
        let mut memo = vec![vec![-1; target + 1]; n + 1];
        
        fn helper(i: usize, c: usize, cost: &Vec<i32>, n: usize, memo: &mut Vec<Vec<i32>>) -> i32 {
            if c == 0 {
                return 0;
            }
            if i == n || (c as i32) < 0 {
                return i32::MIN;
            }
            if memo[i][c] != -1 {
                return memo[i][c];
            }
            let cost_i = cost[i] as usize;
            let take = if c >= cost_i {
                let res = helper(i, c - cost_i, cost, n, memo);
                if res != i32::MIN { res + 1 } else { i32::MIN }
            } else {
                i32::MIN
            };
            let not_take = helper(i + 1, c, cost, n, memo);
            memo[i][c] = take.max(not_take);
            memo[i][c]
        }
        
        let e = helper(0, target, &cost, n, &mut memo);
        if e == i32::MIN {
            return "0".to_string();
        }
        
        let mut t = target;
        let mut s = String::new();
        for k in 0..e as usize {
            for j in (1..=9).rev() {
                let c = cost[j - 1] as usize;
                if c <= t && helper(0, t - c, &cost, n, &mut memo) == e - k as i32 - 1 {
                    t -= c;
                    s.push_str(&j.to_string());
                    break;
                }
            }
        }
        s
    }
}
