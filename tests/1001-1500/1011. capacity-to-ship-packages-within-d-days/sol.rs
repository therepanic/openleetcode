impl Solution {
    pub fn ship_within_days(weights: Vec<i32>, days: i32) -> i32 {
        let mut low = *weights.iter().max().unwrap();
        let mut high = weights.iter().sum();

        while low <= high {
            let mid = (low + high) / 2;

            let mut required_days = 1;
            let mut load = 0;

            for &weight in &weights {
                if load + weight > mid {
                    required_days += 1;
                    load = weight;
                } else {
                    load += weight;
                }
            }

            if required_days <= days {
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }

        low
    }
}
