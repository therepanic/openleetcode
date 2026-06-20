impl Solution {
    pub fn max_profit(k: i32, prices: Vec<i32>) -> i32 {
        let n = prices.len();
        if k == 0 || n < 2 {
            return 0;
        }
        if k as usize >= n / 2 {
            let mut ans = 0;
            for index in 1..n {
                ans += 0.max(prices[index] - prices[index - 1]);
            }
            return ans;
        }

        let size = k as usize + 1;
        let mut hold = vec![-(1_i64 << 60); size];
        let mut free = vec![0_i64; size];
        for price in prices {
            let price = price as i64;
            for t in 1..size {
                hold[t] = hold[t].max(free[t - 1] - price);
                free[t] = free[t].max(hold[t] + price);
            }
        }
        *free.iter().max().unwrap() as i32
    }
}
