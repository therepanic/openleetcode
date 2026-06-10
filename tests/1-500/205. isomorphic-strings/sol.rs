impl Solution {
    pub fn is_isomorphic(s: String, t: String) -> bool {
        let mut st = vec![-1; 256];
        let mut ts = vec![-1; 256];
        for (i, (a, b)) in s.bytes().zip(t.bytes()).enumerate() {
            if st[a as usize] != ts[b as usize] {
                return false;
            }
            st[a as usize] = i as i32;
            ts[b as usize] = i as i32;
        }
        true
    }
}
