impl Solution {
    pub fn regions_by_slashes(grid: Vec<String>) -> i32 {
        let n = grid.len();
        let mut parents: Vec<usize> = (0..4 * n * n).collect();
        let mut count = (4 * n * n) as i32;

        fn find(parents: &mut Vec<usize>, x: usize) -> usize {
            if x != parents[x] {
                parents[x] = find(parents, parents[x]);
            }
            parents[x]
        }

        fn union(parents: &mut Vec<usize>, count: &mut i32, x: usize, y: usize) -> bool {
            let rx = find(parents, x);
            let ry = find(parents, y);
            if rx != ry {
                parents[rx] = ry;
                *count -= 1;
                return true;
            }
            false
        }

        let merges: Vec<Vec<(usize, usize)>> = vec![
            vec![(0, 1), (1, 2), (2, 3)], // ' '
            vec![(0, 3), (1, 2)],         // '/'
            vec![(0, 1), (2, 3)],         // '\\'
        ];

        let grid: Vec<Vec<char>> = grid.iter().map(|s| s.chars().collect()).collect();

        for i in 0..n {
            for j in 0..n {
                let base = (i * n + j) * 4;
                let idx = match grid[i][j] {
                    ' ' => 0,
                    '/' => 1,
                    '\\' => 2,
                    _ => unreachable!(),
                };

                for &(u, v) in &merges[idx] {
                    union(&mut parents, &mut count, base + u, base + v);
                }

                if i + 1 < n {
                    let down_base = ((i + 1) * n + j) * 4;
                    union(&mut parents, &mut count, base + 2, down_base);
                }

                if j + 1 < n {
                    let right_base = (i * n + (j + 1)) * 4;
                    union(&mut parents, &mut count, base + 1, right_base + 3);
                }
            }
        }
        count
    }
}
