impl Solution {
    pub fn find_min_difference(time_points: Vec<String>) -> i32 {
        let mut times: Vec<i32> = time_points.iter().map(|t| {
            let parts: Vec<&str> = t.split(':').collect();
            let h: i32 = parts[0].parse().unwrap();
            let m: i32 = parts[1].parse().unwrap();
            h * 60 + m
        }).collect();
        times.sort_unstable();
        let mut min_diff = i32::MAX;
        for i in 1..times.len() {
            min_diff = min_diff.min(times[i] - times[i - 1]);
        }
        min_diff = min_diff.min(1440 + times[0] - times[times.len() - 1]);
        min_diff
    }
}
