impl Solution {
    pub fn max_profit(prices: Vec<i32>) -> i32 {
        let mut best = 0;
        let mut min_price = i32::MAX;
        for price in prices {
            min_price = min_price.min(price);
            best = best.max(price - min_price);
        }
        best
    }
}
