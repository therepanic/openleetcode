impl Solution {
    pub fn count_substrings(s: String, t: String) -> i32 {
        let s_bytes = s.as_bytes();
        let t_bytes = t.as_bytes();
        let m = s_bytes.len();
        let n = t_bytes.len();
        let mut result = 0;

        for i in 0..m {
            for j in 0..n {
                let mut diff = 0;
                let mut k = 0;
                while i + k < m && j + k < n {
                    if s_bytes[i + k] != t_bytes[j + k] {
                        diff += 1;
                    }
                    if diff > 1 {
                        break;
                    }
                    if diff == 1 {
                        result += 1;
                    }
                    k += 1;
                }
            }
        }

        result as i32
    }
}
