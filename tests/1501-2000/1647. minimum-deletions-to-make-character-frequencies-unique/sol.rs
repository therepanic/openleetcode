impl Solution {
    pub fn min_deletions(s: String) -> i32 {
        let mut count = vec![0; 26];
        for c in s.bytes() {
            count[(c - b'a') as usize] += 1;
        }
        let mut freqs: Vec<i32> = count.into_iter().filter(|&f| f > 0).collect();
        freqs.sort_by(|a, b| b.cmp(a));
        let mut deletes = 0;
        for idx in 1..freqs.len() {
            if freqs[idx] >= freqs[idx - 1] {
                let target = std::cmp::max(0, freqs[idx - 1] - 1);
                deletes += (freqs[idx] - target);
                freqs[idx] = target;
            }
        }
        deletes
    }
}
