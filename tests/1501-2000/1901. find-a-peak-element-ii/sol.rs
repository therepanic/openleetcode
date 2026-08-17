impl Solution {
    pub fn find_peak_grid(mat: Vec<Vec<i32>>) -> Vec<i32> {
        let n = mat.len();
        let m = mat[0].len();

        let mut low = 0;
        let mut high = m as i32 - 1;

        while low <= high {
            let mid = low + (high - low) / 2;

            let mut max_row = 0;
            for i in 1..n {
                if mat[i][mid as usize] > mat[max_row][mid as usize] {
                    max_row = i;
                }
            }

            let left = if mid > 0 { mat[max_row][(mid - 1) as usize] } else { -1 };
            let right = if (mid as usize) < m - 1 { mat[max_row][(mid + 1) as usize] } else { -1 };

            if mat[max_row][mid as usize] > left && mat[max_row][mid as usize] > right {
                return vec![max_row as i32, mid];
            }

            if mat[max_row][mid as usize] < left {
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }

        vec![-1, -1]
    }
}
