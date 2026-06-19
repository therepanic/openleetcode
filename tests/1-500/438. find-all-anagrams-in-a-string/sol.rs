impl Solution {
    pub fn find_anagrams(s: String, p: String) -> Vec<i32> {
        let n1 = s.len();
        let n2 = p.len();
        let mut res = Vec::new();
        if n1 < n2 {
            return res;
        }

        let mut a = [0i32; 26];
        let mut b = [0i32; 26];
        let s_bytes = s.as_bytes();
        let p_bytes = p.as_bytes();

        for i in 0..n2 {
            a[(p_bytes[i] - b'a') as usize] += 1;
            b[(s_bytes[i] - b'a') as usize] += 1;
        }

        if a == b {
            res.push(0);
        }

        for i in n2..n1 {
            b[(s_bytes[i] - b'a') as usize] += 1;
            b[(s_bytes[i - n2] - b'a') as usize] -= 1;
            if a == b {
                res.push((i - n2 + 1) as i32);
            }
        }

        res
    }
}
