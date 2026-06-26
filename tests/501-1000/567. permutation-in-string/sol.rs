impl Solution {
    pub fn check_inclusion(s1: String, s2: String) -> bool {
        let n1 = s1.len();
        let n2 = s2.len();
        if n2 < n1 {
            return false;
        }

        let mut c1 = [0; 26];
        let mut c2 = [0; 26];

        let s1_bytes = s1.as_bytes();
        let s2_bytes = s2.as_bytes();

        for i in 0..n1 {
            c1[(s1_bytes[i] - b'a') as usize] += 1;
            c2[(s2_bytes[i] - b'a') as usize] += 1;
        }

        if c1 == c2 {
            return true;
        }

        for i in n1..n2 {
            c2[(s2_bytes[i] - b'a') as usize] += 1;
            c2[(s2_bytes[i - n1] - b'a') as usize] -= 1;

            if c1 == c2 {
                return true;
            }
        }

        false
    }
}
