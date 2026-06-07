impl Solution {
    pub fn search_matrix(matrix: Vec<Vec<i32>>, target: i32) -> bool {
        let rows = matrix.len();
        let cols = matrix[0].len();
        let mut left = 0i32;
        let mut right = (rows * cols - 1) as i32;

        while left <= right {
            let mid = left + (right - left) / 2;
            let value = matrix[mid as usize / cols][mid as usize % cols];
            if value == target {
                return true;
            }
            if value < target {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        false
    }
}
