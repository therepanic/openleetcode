use std::collections::HashMap;

impl Solution {
    pub fn least_ops_express_target(x: i32, target: i32) -> i32 {
        let mut memo = HashMap::new();
        return Self::dfs(target as i64, x as i64, &mut memo);
    }
    
    fn dfs(val: i64, x: i64, memo: &mut HashMap<i64, i32>) -> i32 {
        if let Some(&v) = memo.get(&val) {
            return v;
        }
        if val < x {
            let res = std::cmp::min(2 * val as i32 - 1, 2 * (x - val) as i32);
            memo.insert(val, res);
            return res;
        }
        
        let k = (val as f64).log(x as f64).floor() as u32;
        let pow = x.pow(k);
        let mut ans = k as i32 + Self::dfs(val - pow, x, memo);
        
        let next_pow = pow * x;
        if next_pow < 2 * val {
            ans = std::cmp::min(ans, k as i32 + 1 + Self::dfs(next_pow - val, x, memo));
        }
        
        memo.insert(val, ans);
        return ans;
    }
}
