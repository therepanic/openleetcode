impl Solution {
    pub fn are_almost_equal(s1: String, s2: String) -> bool {
        let chars1: Vec<char> = s1.chars().collect();
        let chars2: Vec<char> = s2.chars().collect();
        let mut i: i32 = -1;
        let mut j: i32 = -1;
        let mut cnt = 0;
        for k in 0..chars1.len() {
            if chars1[k] != chars2[k] {
                cnt += 1;
                if i == -1 {
                    i = k as i32;
                } else if j == -1 {
                    j = k as i32;
                }
            }
        }
        
        if cnt == 0 { return true; }
        if cnt == 2 && chars1[i as usize] == chars2[j as usize] && chars1[j as usize] == chars2[i as usize] { return true; }
        false
    }
}
