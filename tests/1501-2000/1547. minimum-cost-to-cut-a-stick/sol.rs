impl Solution {
    pub fn min_cost(n: i32, cuts: Vec<i32>) -> i32 {
        let mut c = cuts.clone();
        c.push(0);
        c.push(n);
        c.sort();
        let m = c.len();
        let mut memo = vec![vec![-1; m]; m];
        Self::optimize(0, m-1, &c, &mut memo)
    }
    
    fn optimize(i: usize, j: usize, c: &Vec<i32>, memo: &mut Vec<Vec<i32>>) -> i32 {
        if j - i <= 1 { return 0; }
        if memo[i][j] != -1 { return memo[i][j]; }
        let mut res = i32::MAX;
        for k in (i+1)..j {
            let val = Self::optimize(i, k, c, memo) + Self::optimize(k, j, c, memo);
            res = res.min(val);
        }
        memo[i][j] = res + (c[j] - c[i]);
        memo[i][j]
    }
}
