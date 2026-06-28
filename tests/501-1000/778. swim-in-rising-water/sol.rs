impl Solution {
    pub fn swim_in_water(grid: Vec<Vec<i32>>) -> i32 {
        let n = grid.len();
        let dirs = [(0,-1),(0,1),(-1,0),(1,0)];
        
        fn dfs(x: usize, y: usize, t: i32, vis: &mut Vec<Vec<bool>>, grid: &Vec<Vec<i32>>, n: usize, dirs: &[(i32,i32)]) -> bool {
            if x == n - 1 && y == n - 1 {
                return true;
            }
            vis[x][y] = true;
            for &(dx, dy) in dirs {
                let nx = x as i32 + dx;
                let ny = y as i32 + dy;
                if nx >= 0 && nx < n as i32 && ny >= 0 && ny < n as i32 {
                    let (nx, ny) = (nx as usize, ny as usize);
                    if !vis[nx][ny] && grid[nx][ny] <= t {
                        if dfs(nx, ny, t, vis, grid, n, dirs) {
                            return true;
                        }
                    }
                }
            }
            false
        }
        
        let mut low = 0;
        let mut high = (n * n - 1) as i32;
        let mut ans = i32::MAX;
        while low <= high {
            let mid = (low + high) / 2;
            let mut vis = vec![vec![false; n]; n];
            if grid[0][0] <= mid && dfs(0, 0, mid, &mut vis, &grid, n, &dirs) {
                ans = mid;
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }
        ans
    }
}
