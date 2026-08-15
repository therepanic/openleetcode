impl Solution {
    pub fn largest_magic_square(grid: Vec<Vec<i32>>) -> i32 {
        let m = grid.len();
        let n = grid[0].len();
        let mut res = 1;

        fn is_valid(grid: &Vec<Vec<i32>>, i: usize, j: usize, k: usize) -> bool {
            let mut s = -1;
            for x in i..(i + k) {
                let row: i32 = grid[x][j..(j + k)].iter().sum();
                if s == -1 { s = row; }
                else if s != row { return false; }
            }

            for y in j..(j + k) {
                let col: i32 = (i..(i + k)).map(|x| grid[x][y]).sum();
                if col != s { return false; }
            }

            let d1: i32 = (0..k).map(|d| grid[i + d][j + d]).sum();
            let d2: i32 = (0..k).map(|d| grid[i + d][j + k - 1 - d]).sum();
            d1 == s && d2 == s
        }

        for k in 2..=m.min(n) {
            for i in 0..=(m - k) {
                for j in 0..=(n - k) {
                    if is_valid(&grid, i, j, k) { res = k as i32; }
                }
            }
        }
        res
    }
}
