impl Solution {
    pub fn find_ball(grid: Vec<Vec<i32>>) -> Vec<i32> {
        let m = grid.len();
        let n = grid[0].len();
        let mut result = vec![0; n];
        for col in 0..n {
            let mut cur = col as i32;
            for row in 0..m {
                let d = grid[row][cur as usize];
                let nxt = cur + d;
                if nxt < 0 || nxt >= n as i32 || grid[row][nxt as usize] != d {
                    cur = -1;
                    break;
                }
                cur = nxt;
            }
            result[col] = cur;
        }
        result
    }
}
