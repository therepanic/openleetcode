impl Solution {
    pub fn smallest_chair(times: Vec<Vec<i32>>, target_friend: i32) -> i32 {
        let target_time = times[target_friend as usize].clone();
        let mut times = times;
        times.sort_by(|a, b| a[0].cmp(&b[0]));

        let n = times.len();
        let mut chair_time = vec![0; n];

        for time in &times {
            for i in 0..n {
                if chair_time[i] <= time[0] {
                    chair_time[i] = time[1];
                    if *time == target_time {
                        return i as i32;
                    }
                    break;
                }
            }
        }

        0
    }
}
