impl Solution {
    pub fn num_magic_squares_inside(grid: Vec<Vec<i32>>) -> i32 {
        let m = grid.len();
        let n = grid[0].len();
        if m < 3 || n < 3 {
            return 0;
        }
        let mut c = 0;
        for i in 0..m-2 {
            for j in 0..n-2 {
                if Self::is_magic_square(&grid, i, j) {
                    c += 1;
                }
            }
        }
        c
    }

    fn is_magic_square(grid: &Vec<Vec<i32>>, r: usize, c: usize) -> bool {
        if grid[r+1][c+1] != 5 {
            return false;
        }

        let a = grid[r][c]; let b = grid[r][c+1]; let d = grid[r][c+2];
        let e = grid[r+1][c]; let f = grid[r+1][c+2];
        let h = grid[r+2][c]; let i = grid[r+2][c+1]; let j = grid[r+2][c+2];

        let mut seen = vec![false; 10];
        let arr = [a, b, d, e, f, h, i, j, 5];
        for &x in &arr {
            if x < 1 || x > 9 || seen[x as usize] {
                return false;
            }
            seen[x as usize] = true;
        }

        if a + j != 10 { return false; }
        if b + i != 10 { return false; }
        if d + h != 10 { return false; }
        if e + f != 10 { return false; }

        if a + b + d != 15 { return false; }
        if h + i + j != 15 { return false; }
        if a + e + h != 15 { return false; }
        if d + f + j != 15 { return false; }
        if a + 5 + j != 15 { return false; }
        if d + 5 + h != 15 { return false; }

        true
    }
}
