impl Solution {
    pub fn min_swaps(grid: Vec<Vec<i32>>) -> i32 {
        let n = grid.len();
        let mut zeros = vec![0; n];
        for i in 0..n {
            let mut count = 0;
            for j in (0..n).rev() {
                if grid[i][j] == 0 {
                    count += 1;
                } else {
                    break;
                }
            }
            zeros[i] = count;
        }
        let mut swaps = 0;
        for i in 0..n {
            let needed = n - i - 1;
            let mut j = i;
            while j < n && zeros[j] < needed {
                j += 1;
            }
            if j == n {
                return -1;
            }
            while j > i {
                zeros.swap(j, j - 1);
                j -= 1;
                swaps += 1;
            }
        }
        swaps
    }
}
