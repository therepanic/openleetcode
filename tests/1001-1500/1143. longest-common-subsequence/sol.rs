impl Solution {
    pub fn longest_common_subsequence(text1: String, text2: String) -> i32 {
        let m = text1.len();
        let n = text2.len();
        let mut memo = vec![vec![-1; n]; m];
        let t1: Vec<char> = text1.chars().collect();
        let t2: Vec<char> = text2.chars().collect();

        fn solve(i: usize, j: usize, m: usize, n: usize, t1: &[char], t2: &[char], memo: &mut Vec<Vec<i32>>) -> i32 {
            if i >= m || j >= n {
                return 0;
            }
            if memo[i][j] != -1 {
                return memo[i][j];
            }
            if t1[i] == t2[j] {
                memo[i][j] = 1 + solve(i + 1, j + 1, m, n, t1, t2, memo);
            } else {
                memo[i][j] = solve(i + 1, j, m, n, t1, t2, memo).max(solve(i, j + 1, m, n, t1, t2, memo));
            }
            memo[i][j]
        }

        solve(0, 0, m, n, &t1, &t2, &mut memo)
    }
}
