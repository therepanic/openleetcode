impl Solution {
    pub fn best_team_score(scores: Vec<i32>, ages: Vec<i32>) -> i32 {
        let mut players: Vec<(i32,i32)> = ages.iter().zip(scores.iter()).map(|(&a,&s)| (a,s)).collect();
        players.sort();
        let mut dp = players.iter().map(|&(_,s)| s).collect::<Vec<i32>>();
        for i in 0..players.len() {
            for j in 0..i {
                if players[j].1 <= players[i].1 {
                    dp[i] = dp[i].max(dp[j] + players[i].1);
                }
            }
        }
        *dp.iter().max().unwrap()
    }
}
