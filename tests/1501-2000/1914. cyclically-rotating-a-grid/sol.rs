impl Solution {

    pub fn rotate_grid(grid: Vec<Vec<i32>>, k: i32) -> Vec<Vec<i32>> {

        let mut grid = grid;

        let mut t = 0;

        let mut l = 0;

        let mut b = grid.len() as i32 - 1;

        let mut r = grid[0].len() as i32 - 1;

        while t < b && l < r {

            let ln = b - t;

            let wid = r - l;

            let perimeter = 2 * ln + 2 * wid;

            let mut steps = (k % perimeter) as i32;

            while steps > 0 {

                let tmp = grid[t as usize][l as usize];

                for i in l..r {

                    grid[t as usize][i as usize] = grid[t as usize][(i + 1) as usize];

                }

                for i in t..b {

                    grid[i as usize][r as usize] = grid[(i + 1) as usize][r as usize];

                }

                for i in (l + 1..=r).rev() {

                    grid[b as usize][i as usize] = grid[b as usize][(i - 1) as usize];

                }

                for i in (t + 1..=b).rev() {

                    grid[i as usize][l as usize] = grid[(i - 1) as usize][l as usize];

                }

                grid[(t + 1) as usize][l as usize] = tmp;

                steps -= 1;

            }

            t += 1;

            l += 1;

            b -= 1;

            r -= 1;

        }

        grid

    }

}
