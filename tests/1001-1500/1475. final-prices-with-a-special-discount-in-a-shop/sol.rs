impl Solution {
    pub fn final_prices(prices: Vec<i32>) -> Vec<i32> {
        let mut prices = prices;
        let mut stack: Vec<usize> = Vec::new();
        for i in 0..prices.len() {
            while let Some(&last) = stack.last() {
                if prices[last] >= prices[i] {
                    let index = stack.pop().unwrap();
                    prices[index] -= prices[i];
                } else {
                    break;
                }
            }
            stack.push(i);
        }
        prices
    }
}
