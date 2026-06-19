impl Solution {
    pub fn magical_string(n: i32) -> i32 {
        let n = n as usize;
        if n == 0 {
            return 0;
        }
        if n <= 3 {
            return 1;
        }
        let mut s = vec![1, 2, 2];
        let mut i = 2;
        while s.len() < n {
            let next_val = 3 - s[s.len() - 1];
            let count = s[i];
            for _ in 0..count {
                if s.len() >= n {
                    break;
                }
                s.push(next_val);
            }
            i += 1;
        }
        s[..n].iter().filter(|&&x| x == 1).count() as i32
    }
}
