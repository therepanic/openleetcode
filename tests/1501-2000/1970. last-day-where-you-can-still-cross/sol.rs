impl Solution {
    pub fn latest_day_to_cross(row: i32, col: i32, cells: Vec<Vec<i32>>) -> i32 {
        let row = row as usize;
        let col = col as usize;
        let mut left = 1;
        let mut right = cells.len() as i32;
        let mut answer = 0;
        while left <= right {
            let mid = (left + right) / 2;
            if Self::can_cross(mid as usize, row, col, &cells) {
                answer = mid;
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        answer
    }
    
    fn can_cross(day: usize, row: usize, col: usize, cells: &Vec<Vec<i32>>) -> bool {
        let mut grid = vec![vec![0; col]; row];
        for i in 0..day {
            let r = (cells[i][0] - 1) as usize;
            let c = (cells[i][1] - 1) as usize;
            grid[r][c] = 1;
        }
        
        let mut queue_r = vec![0usize; row * col];
        let mut queue_c = vec![0usize; row * col];
        let mut visited = vec![vec![false; col]; row];
        let mut head = 0;
        let mut tail = 0;
        
        for c in 0..col {
            if grid[0][c] == 0 {
                queue_r[tail] = 0;
                queue_c[tail] = c;
                tail += 1;
                visited[0][c] = true;
            }
        }
        
        let dr = [1, -1, 0, 0];
        let dc = [0, 0, 1, -1];
        
        while head < tail {
            let r = queue_r[head];
            let c = queue_c[head];
            head += 1;
            if r == row - 1 { return true; }
            for k in 0..4 {
                let nr = r as i32 + dr[k];
                let nc = c as i32 + dc[k];
                if nr >= 0 && nr < row as i32 && nc >= 0 && nc < col as i32 && !visited[nr as usize][nc as usize] && grid[nr as usize][nc as usize] == 0 {
                    visited[nr as usize][nc as usize] = true;
                    queue_r[tail] = nr as usize;
                    queue_c[tail] = nc as usize;
                    tail += 1;
                }
            }
        }
        false
    }
}
