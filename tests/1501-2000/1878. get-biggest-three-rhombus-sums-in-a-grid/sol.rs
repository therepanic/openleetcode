impl Solution {
    pub fn get_biggest_three(grid: Vec<Vec<i32>>) -> Vec<i32> {
        let m = grid.len();
        let n = grid[0].len();
        let max_d = (m.min(n)) / 2;
        let mut result: Vec<i32> = Vec::new();
        for d in 0..=max_d {
            for i in d..(m - d) {
                for j in d..(n - d) {
                    let val = Self::diamond_sum(&grid, i, j, d);
                    if !result.contains(&val) {
                        result.push(val);
                    }
                }
            }
        }
        result.sort_by(|a, b| b.cmp(a));
        result.truncate(3);
        result
    }
    
    fn diamond_sum(grid: &Vec<Vec<i32>>, i: usize, j: usize, d: usize) -> i32 {
        if d == 0 { return grid[i][j]; }
        let mut sum = 0;
        for t in 0..=d {
            sum += grid[i - d + t][j + t];
        }
        for t in 1..=d {
            sum += grid[i + t][j + d - t];
        }
        for t in 1..=d {
            sum += grid[i + d - t][j - t];
        }
        for t in 1..d {
            sum += grid[i - t][j - d + t];
        }
        sum
    }
}
