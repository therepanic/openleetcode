impl Solution {
    pub fn number_of_subarrays(nums: Vec<i32>, k: i32) -> i32 {
        use std::collections::HashMap;
        let mut count = HashMap::new();
        count.insert(0, 1);
        let mut odd = 0;
        let mut answer = 0;
        for value in nums {
            odd += value % 2;
            answer += count.get(&(odd - k)).unwrap_or(&0);
            *count.entry(odd).or_insert(0) += 1;
        }
        answer
    }
}
