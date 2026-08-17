impl Solution {
    pub fn max_absolute_sum(nums: Vec<i32>) -> i32 {
        let mut prefix_sum = 0;
        let mut min_prefix_sum = 0;
        let mut max_prefix_sum = 0;
        let mut max_absolute_sum = 0;

        for num in nums {
            prefix_sum += num;
            
            max_absolute_sum = max_absolute_sum.max((prefix_sum - min_prefix_sum).abs());
            max_absolute_sum = max_absolute_sum.max((prefix_sum - max_prefix_sum).abs());
            
            min_prefix_sum = min_prefix_sum.min(prefix_sum);
            max_prefix_sum = max_prefix_sum.max(prefix_sum);
        }

        max_absolute_sum
    }
}
