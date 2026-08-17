impl Solution {
    pub fn count_balls(low_limit: i32, high_limit: i32) -> i32 {
        use std::collections::HashMap;
        let mut box_count: HashMap<i32, i32> = HashMap::new();
        let mut max_balls = 0;
        for num in low_limit..=high_limit {
            let box_val = num.to_string().chars().map(|c| c.to_digit(10).unwrap() as i32).sum();
            *box_count.entry(box_val).or_insert(0) += 1;
            max_balls = max_balls.max(*box_count.get(&box_val).unwrap());
        }
        max_balls
    }
}
