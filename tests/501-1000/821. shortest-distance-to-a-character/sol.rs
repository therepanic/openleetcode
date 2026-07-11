impl Solution {
    pub fn shortest_to_char(s: String, c: char) -> Vec<i32> {
        let n = s.len() as i32;
        let mut ans = vec![n; n as usize];
        let mut prev = -n;
        for (i, ch) in s.chars().enumerate() {
            if ch == c {
                prev = i as i32;
            }
            ans[i] = i as i32 - prev;
        }
        prev = 2 * n;
        for (i, ch) in s.chars().rev().enumerate() {
            let idx = (n as usize) - 1 - i;
            if ch == c {
                prev = idx as i32;
            }
            ans[idx] = ans[idx].min(prev - idx as i32);
        }
        ans
    }
}
