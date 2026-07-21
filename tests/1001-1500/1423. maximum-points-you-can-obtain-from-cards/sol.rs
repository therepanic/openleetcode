impl Solution {
    pub fn max_score(card_points: Vec<i32>, k: i32) -> i32 {
        let k = k as usize;
        let n = card_points.len();
        let mut l = 0;
        let mut total: i32 = card_points[n - k..].iter().sum();
        let mut res = total;
        for r in n - k..n {
            total += card_points[l] - card_points[r];
            res = res.max(total);
            l += 1;
        }
        res
    }
}
