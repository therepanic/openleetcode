impl Solution {
    pub fn min_deletion_size(strs: Vec<String>) -> i32 {
        let rows = strs.len();
        let cols = strs[0].len();
        let mut deletions = 0;

        let strs: Vec<Vec<char>> = strs.into_iter().map(|s| s.chars().collect()).collect();

        for c in 0..cols {
            for r in 0..rows - 1 {
                if strs[r][c] > strs[r + 1][c] {
                    deletions += 1;
                    break;
                }
            }
        }

        deletions
    }
}
