impl Solution {
    pub fn number_ways(hats: Vec<Vec<i32>>) -> i32 {
        const MOD: i32 = 1_000_000_007;
        let n = hats.len();
        let mut liked_by_hat: Vec<Vec<usize>> = vec![vec![]; 41];
        for (person, choices) in hats.iter().enumerate() {
            for &hat in choices {
                liked_by_hat[hat as usize].push(person);
            }
        }
        
        let mut dp = vec![0; 1 << n];
        dp[0] = 1;
        for hat in 1..=40 {
            let mut updated = dp.clone();
            for mask in 0..(1 << n) {
                let count = dp[mask];
                if count == 0 {
                    continue;
                }
                for &person in &liked_by_hat[hat] {
                    let person_bit = 1 << person;
                    if mask & person_bit == 0 {
                        let target = mask | person_bit;
                        updated[target] = (updated[target] + count) % MOD;
                    }
                }
            }
            dp = updated;
        }
        dp[(1 << n) - 1]
    }
}
