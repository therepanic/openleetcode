impl Solution {
    pub fn generate_matrix(n: i32) -> Vec<Vec<i32>> {
        let n = n as usize;
        let mut res = vec![vec![0; n]; n];
        let mut top = 0i32;
        let mut bottom = n as i32 - 1;
        let mut left = 0i32;
        let mut right = n as i32 - 1;
        let mut val = 1;

        while top <= bottom && left <= right {
            for col in left..=right {
                res[top as usize][col as usize] = val;
                val += 1;
            }
            top += 1;

            for row in top..=bottom {
                res[row as usize][right as usize] = val;
                val += 1;
            }
            right -= 1;

            if top <= bottom {
                for col in (left..=right).rev() {
                    res[bottom as usize][col as usize] = val;
                    val += 1;
                }
                bottom -= 1;
            }

            if left <= right {
                for row in (top..=bottom).rev() {
                    res[row as usize][left as usize] = val;
                    val += 1;
                }
                left += 1;
            }
        }

        res
    }
}
