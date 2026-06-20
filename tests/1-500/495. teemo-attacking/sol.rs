impl Solution {
    pub fn find_poisoned_duration(time_series: Vec<i32>, duration: i32) -> i32 {
        let mut total_secs = 0;
        let mut prev: Option<i32> = None;

        for t in time_series {
            total_secs += duration;

            if let Some(prev_val) = prev {
                if prev_val + duration > t {
                    total_secs -= prev_val + duration - t;
                }
            }

            prev = Some(t);
        }

        total_secs
    }
}
