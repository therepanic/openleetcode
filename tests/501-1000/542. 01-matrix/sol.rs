impl Solution {
    pub fn update_matrix(mat: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let mut mat = mat;
        let rows = mat.len();
        let cols = mat[0].len();
        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)];
        let mut queue = std::collections::VecDeque::new();

        for i in 0..rows {
            for j in 0..cols {
                if mat[i][j] == 0 {
                    queue.push_back((i, j));
                } else {
                    mat[i][j] = i32::MAX;
                }
            }
        }

        while let Some((row, col)) = queue.pop_front() {
            for (dr, dc) in &directions {
                let new_row = row as i32 + dr;
                let new_col = col as i32 + dc;

                if new_row >= 0 && new_row < rows as i32 && new_col >= 0 && new_col < cols as i32 {
                    let nr = new_row as usize;
                    let nc = new_col as usize;

                    if mat[nr][nc] > mat[row][col] + 1 {
                        mat[nr][nc] = mat[row][col] + 1;
                        queue.push_back((nr, nc));
                    }
                }
            }
        }

        mat
    }
}
