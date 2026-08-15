impl Solution {
    pub fn max_height(cuboids: Vec<Vec<i32>>) -> i32 {
        let mut cubs = cuboids;
        for c in cubs.iter_mut() {
            c.sort();
        }
        cubs.sort_by(|a, b| {
            if a[0] != b[0] { return a[0].cmp(&b[0]); }
            if a[1] != b[1] { return a[1].cmp(&b[1]); }
            a[2].cmp(&b[2])
        });
        let n = cubs.len();
        let mut dp = vec![0; n];
        let mut ans = 0;
        for i in 0..n {
            dp[i] = cubs[i][2];
            for j in 0..i {
                if cubs[j][0] <= cubs[i][0] && cubs[j][1] <= cubs[i][1] && cubs[j][2] <= cubs[i][2] {
                    dp[i] = dp[i].max(dp[j] + cubs[i][2]);
                }
            }
            ans = ans.max(dp[i]);
        }
        ans
    }
}
