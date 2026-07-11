impl Solution {
    pub fn min_height_shelves(books: Vec<Vec<i32>>, shelf_width: i32) -> i32 {
        let n = books.len();
        let mut dp = vec![i32::MAX; n + 1];
        dp[0] = 0;
        
        for i in 1..=n {
            dp[i] = dp[i - 1] + books[i - 1][1];
            let mut height = 0;
            let mut width = 0;
            for j in (0..i).rev() {
                height = height.max(books[j][1]);
                width += books[j][0];
                if width > shelf_width {
                    break;
                }
                dp[i] = dp[i].min(dp[j] + height);
            }
        }
        
        dp[n]
    }
}
