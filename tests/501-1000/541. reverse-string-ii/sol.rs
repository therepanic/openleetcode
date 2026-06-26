impl Solution {
    pub fn reverse_str(s: String, k: i32) -> String {
        let mut arr: Vec<char> = s.chars().collect();
        let step = (2 * k) as usize;
        let mut i = 0;
        while i < arr.len() {
            let mut start = i;
            let mut end = std::cmp::min(i + k as usize - 1, arr.len() - 1);
            while start < end {
                arr.swap(start, end);
                start += 1;
                end -= 1;
            }
            i += step;
        }
        arr.iter().collect()
    }
}
