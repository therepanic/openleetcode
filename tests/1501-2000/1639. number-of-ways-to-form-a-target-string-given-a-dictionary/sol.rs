impl Solution {
    pub fn num_ways(words: Vec<String>, target: String) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let n = words.len();
        let m = words[0].len();
        let mut A = vec![vec![0i64; 26]; m];
        for word in words.iter() {
            for (j, ch) in word.chars().enumerate() {
                A[j][ch as usize - 'a' as usize] += 1;
            }
        }
        let t: Vec<char> = target.chars().collect();
        let mut dp = vec![vec![-1i64; t.len()]; m];
        
        fn F(i: usize, j: usize, A: &Vec<Vec<i64>>, t: &Vec<char>, dp: &mut Vec<Vec<i64>>) -> i64 {
            if j == t.len() { return 1; }
            if i == A.len() { return 0; }
            if dp[i][j] != -1 { return dp[i][j]; }
            let mut count = F(i+1, j, A, t, dp) % MOD;
            count = (count + A[i][t[j] as usize - 'a' as usize] * F(i+1, j+1, A, t, dp)) % MOD;
            dp[i][j] = count;
            count
        }
        F(0, 0, &A, &t, &mut dp) as i32
    }
}
