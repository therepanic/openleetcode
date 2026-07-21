impl Solution {
    pub fn sort_string(s: String) -> String {
        if s.is_empty() {
            return String::new();
        }
        let mut counts = [0u32; 26];
        for c in s.chars() {
            counts[(c as usize) - ('a' as usize)] += 1;
        }
        let mut ans = String::new();
        loop {
            let mut added = false;
            for i in 0..26 {
                if counts[i] > 0 {
                    ans.push((b'a' + i as u8) as char);
                    counts[i] -= 1;
                    added = true;
                }
            }
            for i in (0..26).rev() {
                if counts[i] > 0 {
                    ans.push((b'a' + i as u8) as char);
                    counts[i] -= 1;
                    added = true;
                }
            }
            if !added {
                break;
            }
        }
        ans
    }
}
