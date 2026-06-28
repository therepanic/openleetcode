impl Solution {
    pub fn find_shortest_sub_array(nums: Vec<i32>) -> i32 {
        use std::collections::HashMap;
        
        let mut left: HashMap<i32, usize> = HashMap::new();
        let mut right: HashMap<i32, usize> = HashMap::new();
        let mut count: HashMap<i32, i32> = HashMap::new();
        
        for (i, &x) in nums.iter().enumerate() {
            if !left.contains_key(&x) {
                left.insert(x, i);
            }
            right.insert(x, i);
            *count.entry(x).or_insert(0) += 1;
        }
        
        let mut ans = nums.len() as i32;
        let degree = count.values().max().copied().unwrap_or(0);
        
        for (&x, &c) in &count {
            if c == degree {
                let len = (right[&x] - left[&x] + 1) as i32;
                ans = ans.min(len);
            }
        }
        
        ans
    }
}
