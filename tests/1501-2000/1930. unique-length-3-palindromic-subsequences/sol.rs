impl Solution {
    pub fn count_palindromic_subsequence(s: String) -> i32 {
        let chars: Vec<char> = s.chars().collect();
        let n = chars.len();
        let mut first = vec![-1; 26];
        let mut last = vec![-1; 26];

        for i in 0..n {
            let c = (chars[i] as u8 - b'a') as usize;
            if first[c] == -1 {
                first[c] = i as i32;
            }
            last[c] = i as i32;
        }

        let mut ans = 0;
        for c in 0..26 {
            if first[c] != -1 && last[c] - first[c] > 1 {
                let mut mask = 0u32;
                for i in (first[c] as usize + 1)..(last[c] as usize) {
                    mask |= 1 << (chars[i] as u8 - b'a');
                }
                ans += mask.count_ones() as i32;
            }
        }
        ans
    }
}
