impl Solution {
    pub fn grid_game(grid: Vec<Vec<i32>>) -> i64 {
        let mut min_result = i64::MAX;
        let mut row1_sum: i64 = grid[0].iter().map(|&x| x as i64).sum();
        let mut row2_sum: i64 = 0;
        
        for i in 0..grid[0].len() {
            row1_sum -= grid[0][i] as i64;
            let current_max = row1_sum.max(row2_sum);
            min_result = min_result.min(current_max);
            row2_sum += grid[1][i] as i64;
        }
        
        min_result
    }
}
