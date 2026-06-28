impl Solution {
    pub fn partition_labels(s: String) -> Vec<i32> {
        let bytes = s.as_bytes();
        let mut last = [0usize; 26];
        for i in 0..bytes.len() {
            last[(bytes[i] - b'a') as usize] = i;
        }
        let mut ans = Vec::new();
        let mut start = 0usize;
        let mut end = 0usize;
        for i in 0..bytes.len() {
            end = end.max(last[(bytes[i] - b'a') as usize]);
            if i == end {
                ans.push((end - start + 1) as i32);
                start = i + 1;
            }
        }
        ans
    }
}
