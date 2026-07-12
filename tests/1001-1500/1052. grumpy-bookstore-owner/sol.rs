impl Solution {
    pub fn max_satisfied(customers: Vec<i32>, grumpy: Vec<i32>, minutes: i32) -> i32 {
        let n = customers.len();
        let minutes = minutes as usize;
        let mut total_satisfied = 0;
        let mut current_window_gain = 0;
        
        for i in 0..n {
            if grumpy[i] == 0 {
                total_satisfied += customers[i];
            } else if i < minutes {
                current_window_gain += customers[i];
            }
        }
        
        let mut max_window_gain = current_window_gain;
        
        for i in minutes..n {
            if grumpy[i] == 1 {
                current_window_gain += customers[i];
            }
            if grumpy[i - minutes] == 1 {
                current_window_gain -= customers[i - minutes];
            }
            if current_window_gain > max_window_gain {
                max_window_gain = current_window_gain;
            }
        }
        
        total_satisfied + max_window_gain
    }
}
