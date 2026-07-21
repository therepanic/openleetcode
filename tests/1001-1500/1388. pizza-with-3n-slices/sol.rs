impl Solution {
    pub fn max_size_slices(slices: Vec<i32>) -> i32 {
        let n = slices.len();
        let m = n / 3;

        fn dp(slices_subset: &[i32], m: usize) -> i32 {
            let k = slices_subset.len();
            let mut dp_table = vec![vec![0; m + 1]; k + 1];
            for i in 1..=k {
                for j in 1..=std::cmp::min(i, m) {
                    dp_table[i][j] = std::cmp::max(
                        dp_table[i - 1][j],
                        (if i > 1 { dp_table[i - 2][j - 1] } else { 0 }) + slices_subset[i - 1],
                    );
                }
            }
            dp_table[k][m]
        }

        std::cmp::max(
            dp(&slices[..n - 1], m),
            dp(&slices[1..], m),
        )
    }
}
