impl Solution {
    pub fn large_group_positions(s: String) -> Vec<Vec<i32>> {
        let mut intervals: Vec<Vec<i32>> = Vec::new();
        let chars: Vec<char> = s.chars().collect();
        let mut left = 0;
        while left < chars.len() {
            let start = left;
            while left + 1 < chars.len() && chars[left + 1] == chars[left] {
                left += 1;
            }
            if left - start >= 2 {
                intervals.push(vec![start as i32, left as i32]);
            }
            left += 1;
        }
        intervals
    }
}
