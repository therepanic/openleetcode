impl Solution {
    pub fn rotate_the_box(box_grid: Vec<Vec<char>>) -> Vec<Vec<char>> {
        let grid = box_grid;
        let r = grid.len();
        let c = grid[0].len();
        let mut rotate = vec![vec!['.'; r]; c];
        for i in 0..r {
            let mut bottom = c - 1;
            for j in (0..c).rev() {
                if grid[i][j] == '#' {
                    rotate[bottom][r - 1 - i] = '#';
                    bottom -= 1;
                } else if grid[i][j] == '*' {
                    rotate[j][r - 1 - i] = '*';
                    bottom = j - 1;
                }
            }
        }
        rotate
    }
}
