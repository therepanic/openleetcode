impl Solution {
    pub fn min_cost(colors: String, needed_time: Vec<i32>) -> i32 {
        let chars: Vec<char> = colors.chars().collect();
        let n = chars.len();
        let mut sum = 0;
        let mut time = needed_time;
        for i in 1..n {
            if chars[i] == chars[i - 1] {
                sum += time[i].min(time[i - 1]);
                time[i] = time[i].max(time[i - 1]);
            }
        }
        sum
    }
}
