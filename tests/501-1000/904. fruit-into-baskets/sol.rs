impl Solution {
    pub fn total_fruit(fruits: Vec<i32>) -> i32 {
        let mut start = 0;
        let mut max_len = 0;
        use std::collections::HashMap;
        let mut fruit_count: HashMap<i32, i32> = HashMap::new();
        
        for end in 0..fruits.len() {
            *fruit_count.entry(fruits[end]).or_insert(0) += 1;
            
            while fruit_count.len() > 2 {
                let left_fruit = fruits[start];
                if let Some(count) = fruit_count.get_mut(&left_fruit) {
                    *count -= 1;
                    if *count == 0 {
                        fruit_count.remove(&left_fruit);
                    }
                }
                start += 1;
            }
            
            max_len = max_len.max((end - start + 1) as i32);
        }
        
        max_len
    }
}
