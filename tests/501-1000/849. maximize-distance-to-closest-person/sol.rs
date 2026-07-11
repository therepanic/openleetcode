impl Solution {
    pub fn max_dist_to_closest(seats: Vec<i32>) -> i32 {
        let s: String = seats.iter().map(|&x| if x == 1 { '1' } else { '0' }).collect();
        let parts: Vec<&str> = s.split('1').collect();
        let max_val = parts.iter().map(|p| p.len()).max().unwrap_or(0);
        let first = parts[0].len();
        let last = parts[parts.len() - 1].len();
        let mid = (max_val + 1) / 2;
        std::cmp::max(std::cmp::max(first, mid), last) as i32
    }
}
