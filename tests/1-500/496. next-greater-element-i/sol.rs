impl Solution {
    pub fn next_greater_element(nums1: Vec<i32>, nums2: Vec<i32>) -> Vec<i32> {
        use std::collections::HashMap;
        
        let mut next_greater: HashMap<i32, i32> = HashMap::new();
        let mut stack: Vec<i32> = Vec::new();
        
        for &num in nums2.iter().rev() {
            while let Some(&top) = stack.last() {
                if top <= num {
                    stack.pop();
                } else {
                    break;
                }
            }
            next_greater.insert(num, if stack.is_empty() { -1 } else { *stack.last().unwrap() });
            stack.push(num);
        }
        
        nums1.iter().map(|num| *next_greater.get(num).unwrap()).collect()
    }
}
