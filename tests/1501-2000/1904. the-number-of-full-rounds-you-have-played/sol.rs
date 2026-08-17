impl Solution {
    pub fn number_of_rounds(login_time: String, logout_time: String) -> i32 {
        fn to_minutes(t: &str) -> i32 {
            let parts: Vec<i32> = t.split(':').map(|s| s.parse().unwrap()).collect();
            parts[0] * 60 + parts[1]
        }

        let start = to_minutes(&login_time);
        let mut end = to_minutes(&logout_time);

        if end < start {
            end += 24 * 60;
        }

        let start_round = (start + 14) / 15;
        let end_round = end / 15;

        (end_round - start_round).max(0)
    }
}
