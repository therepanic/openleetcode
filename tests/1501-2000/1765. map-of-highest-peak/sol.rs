impl Solution {
    pub fn highest_peak(is_water: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let r = is_water.len();
        let c = is_water[0].len();
        let mut height = vec![vec![1_000_000_000i32; c]; r];

        for i in 0..r {
            for j in 0..c {
                if is_water[i][j] == 1 {
                    height[i][j] = 0;
                } else {
                    if i > 0 { height[i][j] = height[i][j].min(height[i - 1][j] + 1); }
                    if j > 0 { height[i][j] = height[i][j].min(height[i][j - 1] + 1); }
                }
            }
        }

        for i in (0..r).rev() {
            for j in (0..c).rev() {
                if i < r - 1 { height[i][j] = height[i][j].min(height[i + 1][j] + 1); }
                if j < c - 1 { height[i][j] = height[i][j].min(height[i][j + 1] + 1); }
            }
        }

        height
    }
}
