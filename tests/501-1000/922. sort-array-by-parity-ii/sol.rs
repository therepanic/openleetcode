impl Solution {
    pub fn sort_array_by_parity_ii(nums: Vec<i32>) -> Vec<i32> {
        let mut nums = nums;
        let mut i = 0;
        let mut j = 1;
        let n = nums.len();
        
        while i < n && j < n {
            if nums[i] % 2 == 0 {
                i += 2;
            } else if nums[j] % 2 == 1 {
                j += 2;
            } else {
                let temp = nums[i];
                nums[i] = nums[j];
                nums[j] = temp;
                i += 2;
                j += 2;
            }
        }
        nums
    }
}
