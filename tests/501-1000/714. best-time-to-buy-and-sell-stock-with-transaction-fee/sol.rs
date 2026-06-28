impl Solution {
    pub fn max_profit(prices: Vec<i32>, fee: i32) -> i32 {
        let mut hold = -prices[0];
        let mut cash = 0;

        for &price in &prices[1..] {
            cash = cash.max(hold + price - fee);
            hold = hold.max(cash - price);
        }

        cash
    }
}
