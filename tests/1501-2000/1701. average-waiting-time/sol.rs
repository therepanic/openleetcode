impl Solution {
    pub fn average_waiting_time(customers: Vec<Vec<i32>>) -> f64 {
        let mut waiting = 0i64;
        let mut current = 0i32;
        let count = customers.len();
        for customer in customers {
            let arrival = customer[0];
            let time = customer[1];
            if current <= arrival {
                current = arrival + time;
                waiting += time as i64;
            } else {
                current += time;
                waiting += (current - arrival) as i64;
            }
        }
        waiting as f64 / count as f64
    }
}
