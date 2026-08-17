impl Solution {
    pub fn min_operations_max_profit(customers: Vec<i32>, boarding_cost: i32, running_cost: i32) -> i32 {
        let mut wait = 0;
        let mut profit = 0;
        let mut max_profit = 0;
        let mut ans = -1;
        let mut i = 0;
        let mut rotation = 0;

        while i < customers.len() || wait > 0 {
            if i < customers.len() {
                wait += customers[i];
            }
            let boarded = wait.min(4);
            wait -= boarded;

            rotation += 1;
            profit += boarded * boarding_cost - running_cost;

            if profit > max_profit {
                max_profit = profit;
                ans = rotation;
            }

            i += 1;
        }

        ans
    }
}
