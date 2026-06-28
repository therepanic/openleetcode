impl Solution {
    pub fn min_cost_climbing_stairs(cost: Vec<i32>) -> i32 {
        let mut prev2 = 0;
        let mut prev1 = 0;
        for value in cost {
            let current = prev1.min(prev2) + value;
            prev2 = prev1;
            prev1 = current;
        }
        prev1.min(prev2)
    }
}
