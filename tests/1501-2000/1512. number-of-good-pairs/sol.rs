impl Solution {
    pub fn num_identical_pairs(nums: Vec<i32>) -> i32 {
        let mut pairs = std::collections::HashMap::new();
        let mut count = 0;
        for num in nums {
            if let Some(&val) = pairs.get(&num) {
                count += val;
            }
            *pairs.entry(num).or_insert(0) += 1;
        }
        count
    }
}
