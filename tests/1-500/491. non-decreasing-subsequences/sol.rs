use std::collections::HashSet;

impl Solution {
    pub fn find_subsequences(nums: Vec<i32>) -> Vec<Vec<i32>> {
        let mut result = HashSet::new();
        
        fn backtrack(index: usize, path: &mut Vec<i32>, nums: &Vec<i32>, result: &mut HashSet<Vec<i32>>) {
            if path.len() >= 2 {
                result.insert(path.clone());
            }
            for i in index..nums.len() {
                if path.is_empty() || nums[i] >= *path.last().unwrap() {
                    path.push(nums[i]);
                    backtrack(i + 1, path, nums, result);
                    path.pop();
                }
            }
        }
        
        backtrack(0, &mut vec![], &nums, &mut result);
        result.into_iter().collect()
    }
}
