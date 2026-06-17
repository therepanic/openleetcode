impl Solution {
    pub fn max_profit(prices: Vec<i32>) -> i32 {
        let mut a = i32::MIN;
        let mut b = 0;
        let mut c = 0;
        for p in prices {
            let new_a = a.max(c - p);
            let new_b = a + p;
            let new_c = c.max(b);
            a = new_a;
            b = new_b;
            c = new_c;
        }
        b.max(c)
    }
}
