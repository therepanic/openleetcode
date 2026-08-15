use std::collections::BinaryHeap;
use std::cmp::Reverse;

impl Solution {
    pub fn minimum_deviation(nums: Vec<i32>) -> i32 {
        if nums.is_empty() {
            return i32::MAX;
        }
        
        let mut max_heap = BinaryHeap::new();
        let mut min_val = i32::MAX;
        
        for &num in &nums {
            if num % 2 == 0 {
                max_heap.push(num);
                min_val = min_val.min(num);
            } else {
                max_heap.push(num * 2);
                min_val = min_val.min(num * 2);
            }
        }
        
        let mut res = i32::MAX;
        while max_heap.peek().unwrap() % 2 == 0 {
            let max_val = max_heap.pop().unwrap();
            res = res.min(max_val - min_val);
            let new_num = max_val / 2;
            max_heap.push(new_num);
            min_val = min_val.min(new_num);
        }
        
        res = res.min(max_heap.peek().unwrap() - min_val);
        res
    }
}
