impl Solution {
    pub fn slowest_key(release_times: Vec<i32>, keys_pressed: String) -> char {
        let mut max_time = release_times[0];
        let mut ans = keys_pressed.chars().next().unwrap();
        for i in 1..release_times.len() {
            let curr_time = release_times[i] - release_times[i-1];
            if curr_time > max_time {
                max_time = curr_time;
                ans = keys_pressed.chars().nth(i).unwrap();
            } else if curr_time == max_time {
                let c = keys_pressed.chars().nth(i).unwrap();
                if c > ans {
                    ans = c;
                }
            }
        }
        ans
    }
}
