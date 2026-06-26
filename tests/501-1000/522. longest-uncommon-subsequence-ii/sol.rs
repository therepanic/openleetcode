impl Solution {
    pub fn find_lu_slength(strs: Vec<String>) -> i32 {
        let mut strs = strs;
        strs.sort_by(|a, b| b.len().cmp(&a.len()));

        fn is_subsequence(s: &str, t: &str) -> bool {
            let mut s_chars = s.chars();
            let mut current = s_chars.next();
            for c in t.chars() {
                if let Some(ch) = current {
                    if ch == c {
                        current = s_chars.next();
                    }
                } else {
                    break;
                }
            }
            current.is_none()
        }

        for i in 0..strs.len() {
            let mut unique = true;
            for j in 0..strs.len() {
                if i == j {
                    continue;
                }
                if is_subsequence(&strs[i], &strs[j]) {
                    unique = false;
                    break;
                }
            }
            if unique {
                return strs[i].len() as i32;
            }
        }

        -1
    }
}
