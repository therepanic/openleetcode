impl Solution {
    pub fn count_substrings(s: String) -> i32 {
        let s = s.as_bytes();
        let mut count = 0;
        
        let expand = |mut left: i32, mut right: i32| -> i32 {
            let mut res = 0;
            while left >= 0 && right < s.len() as i32 && s[left as usize] == s[right as usize] {
                res += 1;
                left -= 1;
                right += 1;
            }
            res
        };
        
        for i in 0..s.len() {
            count += expand(i as i32, i as i32);
            count += expand(i as i32, i as i32 + 1);
        }
        
        count
    }
}
