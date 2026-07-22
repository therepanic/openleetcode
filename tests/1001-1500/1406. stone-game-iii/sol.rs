impl Solution {
    pub fn stone_game_iii(stone_value: Vec<i32>) -> String {
        let n = stone_value.len();
        let mut dp = vec![0; 3];

        for i in (0..n).rev() {
            let take_one = stone_value[i] - dp[(i + 1) % 3];

            let mut take_two = i32::MIN;
            if i + 1 < n {
                take_two = stone_value[i] + stone_value[i + 1] - dp[(i + 2) % 3];
            }

            let mut take_three = i32::MIN;
            if i + 2 < n {
                take_three = stone_value[i] + stone_value[i + 1] + stone_value[i + 2] - dp[(i + 3) % 3];
            }

            dp[i % 3] = take_one.max(take_two).max(take_three);
        }

        let value = dp[0];
        if value > 0 {
            "Alice".to_string()
        } else if value < 0 {
            "Bob".to_string()
        } else {
            "Tie".to_string()
        }
    }
}
