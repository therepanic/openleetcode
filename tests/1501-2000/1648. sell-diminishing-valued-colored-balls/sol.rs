impl Solution {
    pub fn max_profit(inventory: Vec<i32>, orders: i32) -> i32 {
        let max_val = *inventory.iter().max().unwrap();
        let t = Self::binary_search(&inventory, 0, max_val as i64, orders as i64);
        let mut total: i64 = 0;
        let mut sold: i64 = 0;
        for &ball in &inventory {
            let ball_i64 = ball as i64;
            if ball_i64 > t {
                let cnt = ball_i64 - t;
                total += (ball_i64 + t + 1) * cnt / 2;
                sold += cnt;
            }
        }
        let extra = sold - orders as i64;
        let res = total - extra * (t + 1);
        let modulo = 1_000_000_007i64;
        ((res % modulo + modulo) % modulo) as i32
    }

    fn binary_search(arr: &Vec<i32>, mut left: i64, mut right: i64, target: i64) -> i64 {
        while left < right {
            let mid = (left + right + 1) / 2;
            let mut count: i64 = 0;
            for &x in arr {
                let x_i64 = x as i64;
                if x_i64 > mid {
                    count += x_i64 - mid;
                }
            }
            if count >= target {
                left = mid;
            } else {
                right = mid - 1;
            }
        }
        left
    }
}
