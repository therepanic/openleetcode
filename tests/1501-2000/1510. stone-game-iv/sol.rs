impl Solution {
    pub fn winner_square_game(n: i32) -> bool {
        let n = n as usize;
        let mut memo = vec![vec![-1i8; n + 1]; 2];
        fn dp(player: usize, stones: usize, memo: &mut Vec<Vec<i8>>) -> bool {
            if stones == 0 {
                return false;
            }
            if memo[player][stones] != -1 {
                return memo[player][stones] == 1;
            }
            let sqrt = (stones as f64).sqrt() as usize;
            for i in (1..=sqrt).rev() {
                let sq = i * i;
                if sq == stones || !dp(player ^ 1, stones - sq, memo) {
                    memo[player][stones] = 1;
                    return true;
                }
            }
            memo[player][stones] = 0;
            false
        }
        dp(0, n, &mut memo)
    }
}
