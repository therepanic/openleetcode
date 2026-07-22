impl Solution {
    pub fn max_length(arr: Vec<String>) -> i32 {
        let mut ans = 0;

        fn is_unique(s: &str) -> bool {
            let mut mask = 0u32;
            for c in s.chars() {
                let bit = 1 << (c as u32 - 'a' as u32);
                if mask & bit != 0 {
                    return false;
                }
                mask |= bit;
            }
            true
        }

        fn has_common(a: &str, b: &str) -> bool {
            b.chars().any(|c| a.contains(c))
        }

        fn dfs(i: usize, path: &str, arr: &Vec<String>, ans: &mut i32) {
            *ans = (*ans).max(path.len() as i32);
            for j in i..arr.len() {
                let s = &arr[j];
                if !is_unique(s) || has_common(path, s) {
                    continue;
                }
                let new_path = format!("{}{}", path, s);
                dfs(j + 1, &new_path, arr, ans);
            }
        }

        dfs(0, "", &arr, &mut ans);
        ans
    }
}
