use std::collections::BinaryHeap;
use std::cmp::Reverse;

impl Solution {
    pub fn trap_rain_water(height_map: Vec<Vec<i32>>) -> i32 {
        if height_map.is_empty() || height_map.len() < 3 || height_map[0].len() < 3 {
            return 0;
        }

        let m = height_map.len();
        let n = height_map[0].len();
        let mut visited = vec![vec![false; n]; m];
        let mut heap = BinaryHeap::new();

        for i in 0..m {
            heap.push(Reverse((height_map[i][0], i, 0)));
            heap.push(Reverse((height_map[i][n - 1], i, n - 1)));
            visited[i][0] = true;
            visited[i][n - 1] = true;
        }
        for j in 0..n {
            heap.push(Reverse((height_map[0][j], 0, j)));
            heap.push(Reverse((height_map[m - 1][j], m - 1, j)));
            visited[0][j] = true;
            visited[m - 1][j] = true;
        }

        let mut result = 0;
        let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)];

        while let Some(Reverse((height, x, y))) = heap.pop() {
            for (dx, dy) in &directions {
                let nx = x as i32 + dx;
                let ny = y as i32 + dy;
                if nx >= 0 && nx < m as i32 && ny >= 0 && ny < n as i32 {
                    let nx = nx as usize;
                    let ny = ny as usize;
                    if !visited[nx][ny] {
                        result += 0.max(height - height_map[nx][ny]);
                        heap.push(Reverse((height.max(height_map[nx][ny]), nx, ny)));
                        visited[nx][ny] = true;
                    }
                }
            }
        }

        result
    }
}
