impl Solution {
    pub fn subarray_sum(nums: Vec<i32>, k: i32) -> i32 {
        use std::collections::HashMap;
        
        let mut sub_num = HashMap::new();
        sub_num.insert(0, 1);
        let mut total = 0;
        let mut count = 0;
        
        for n in nums {
            total += n;
            
            if let Some(&val) = sub_num.get(&(total - k)) {
                count += val;
            }
            
            *sub_num.entry(total).or_insert(0) += 1;
        }
        
        count
    }
}
