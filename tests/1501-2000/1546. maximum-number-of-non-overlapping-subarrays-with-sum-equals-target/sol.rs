impl Solution {
    pub fn max_non_overlapping(nums: Vec<i32>, target: i32) -> i32 {
        let mut num_of_subarrays = 0;
        let mut temp = 0;
        let mut visited = std::collections::HashSet::new();
        visited.insert(0);
        for num in nums {
            temp += num;
            let prev = temp - target;
            if visited.contains(&prev) {
                visited.clear();
                num_of_subarrays += 1;
            }
            visited.insert(temp);
        }
        num_of_subarrays
    }
}
