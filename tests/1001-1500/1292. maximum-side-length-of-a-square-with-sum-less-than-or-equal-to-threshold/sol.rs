impl Solution {
    pub fn max_side_length(mat: Vec<Vec<i32>>, threshold: i32) -> i32 {
        let n = mat.len();
        let m = mat[0].len();
        let mut pref = mat.clone();
        for i in 0..n {
            for j in 1..m {
                pref[i][j] += pref[i][j - 1];
            }
        }
        for j in 0..m {
            for i in 1..n {
                pref[i][j] += pref[i - 1][j];
            }
        }
        let is_valid = |k: usize| -> bool {
            for i in (k - 1)..n {
                for j in (k - 1)..m {
                    let x1 = i - k + 1;
                    let y1 = j - k + 1;
                    let mut total = pref[i][j];
                    if x1 > 0 {
                        total -= pref[x1 - 1][j];
                    }
                    if y1 > 0 {
                        total -= pref[i][y1 - 1];
                    }
                    if x1 > 0 && y1 > 0 {
                        total += pref[x1 - 1][y1 - 1];
                    }
                    if total <= threshold {
                        return true;
                    }
                }
            }
            false
        };
        let mut low = 1;
        let mut high = n.min(m);
        let mut ans = 0;
        while low <= high {
            let mid = (low + high) / 2;
            if is_valid(mid) {
                ans = mid;
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        ans as i32
    }
}
