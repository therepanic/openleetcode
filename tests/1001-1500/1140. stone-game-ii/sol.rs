impl Solution {
    pub fn stone_game_ii(piles: Vec<i32>) -> i32 {
        let n = piles.len();
        let mut suffix = vec![0; n + 1];
        for i in (0..n).rev() {
            suffix[i] = suffix[i + 1] + piles[i];
        }
        let mut memo = vec![vec![-1; n + 1]; n];
        
        fn best(i: usize, m: usize, n: usize, suffix: &[i32], memo: &mut Vec<Vec<i32>>) -> i32 {
            if i >= n {
                return 0;
            }
            if memo[i][m] != -1 {
                return memo[i][m];
            }
            let mut answer = 0;
            let max_x = (2 * m).min(n - i);
            for x in 1..=max_x {
                let val = suffix[i] - best(i + x, m.max(x), n, suffix, memo);
                answer = answer.max(val);
            }
            memo[i][m] = answer;
            answer
        }
        
        best(0, 1, n, &suffix, &mut memo)
    }
}
