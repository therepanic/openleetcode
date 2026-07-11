impl Solution {
    pub fn partition_disjoint(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        let mut prefix_max = vec![0; n];
        prefix_max[0] = nums[0];
        for i in 1..n {
            prefix_max[i] = prefix_max[i-1].max(nums[i]);
        }
        
        let mut suffix_min = vec![0; n];
        suffix_min[n-1] = nums[n-1];
        for i in (0..n-1).rev() {
            suffix_min[i] = suffix_min[i+1].min(nums[i]);
        }
        
        for i in 0..n-1 {
            if prefix_max[i] <= suffix_min[i+1] {
                return (i + 1) as i32;
            }
        }
        -1
    }
}
