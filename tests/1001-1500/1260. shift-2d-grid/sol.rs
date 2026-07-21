impl Solution {
    pub fn shift_grid(grid: Vec<Vec<i32>>, k: i32) -> Vec<Vec<i32>> {
        let mut grid = grid;
        let m = grid.len();
        let n = grid[0].len();
        let total = (m * n) as i32;
        let mut k = k % total;
        if k == 0 {
            return grid;
        }
        
        let mut last_k_elements: Vec<i32> = vec![0; k as usize];
        let mut i = m as i32 - 1;
        let mut x = n as i32 - 1;
        let mut count = 0;
        
        while count != k {
            last_k_elements[count as usize] = grid[i as usize][x as usize];
            if x >= 1 {
                x -= 1;
            } else {
                i -= 1;
                x = n as i32 - 1;
            }
            count += 1;
        }
        
        let mut j = m as i32 - 1;
        let mut y = n as i32 - 1;
        
        while i != 0 || x != -1 {
            if x == -1 {
                i -= 1;
                x = n as i32 - 1;
            }
            if y == -1 {
                j -= 1;
                y = n as i32 - 1;
            }
            grid[j as usize][y as usize] = grid[i as usize][x as usize];
            x -= 1;
            y -= 1;
        }
        
        let mut idx = 0;
        while k > 0 {
            if y == -1 {
                j -= 1;
                y = n as i32 - 1;
            }
            grid[j as usize][y as usize] = last_k_elements[idx];
            y -= 1;
            k -= 1;
            idx += 1;
        }
        
        grid
    }
}
