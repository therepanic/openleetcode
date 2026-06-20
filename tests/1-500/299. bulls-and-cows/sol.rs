impl Solution {
    pub fn get_hint(secret: String, guess: String) -> String {
        let mut bulls = 0;
        let mut secret_counts = [0; 10];
        let mut guess_counts = [0; 10];

        for (s, g) in secret.chars().zip(guess.chars()) {
            if s == g {
                bulls += 1;
            } else {
                secret_counts[s as usize - '0' as usize] += 1;
                guess_counts[g as usize - '0' as usize] += 1;
            }
        }

        let mut cows = 0;
        for i in 0..10 {
            cows += std::cmp::min(secret_counts[i], guess_counts[i]);
        }
        format!("{}A{}B", bulls, cows)
    }
}
