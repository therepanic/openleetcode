impl Solution {
    pub fn maximum_removals(s: String, p: String, removable: Vec<i32>) -> i32 {
        let s: Vec<char> = s.chars().collect();
        let p: Vec<char> = p.chars().collect();
        let mut left = 0;
        let mut right = removable.len();
        let mut max_k = 0;
        while left <= right {
            let mid = (left + right) / 2;
            let mut removed = vec![false; s.len()];
            for i in 0..mid {
                removed[removable[i] as usize] = true;
            }
            let mut j = 0;
            for i in 0..s.len() {
                if j >= p.len() {
                    break;
                }
                if !removed[i] && s[i] == p[j] {
                    j += 1;
                }
            }
            if j == p.len() {
                max_k = mid;
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        max_k as i32
    }
}
