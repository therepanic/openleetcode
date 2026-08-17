impl Solution {
    pub fn rearrange_array(nums: Vec<i32>) -> Vec<i32> {
        let mut nums = nums;
        nums.sort();
        let mut res = vec![0; nums.len()];
        let mid = (nums.len() + 1) / 2;
        let mut j = 0;
        for i in (0..nums.len()).step_by(2) {
            res[i] = nums[j];
            j += 1;
        }
        j = mid;
        for i in (1..nums.len()).step_by(2) {
            res[i] = nums[j];
            j += 1;
        }
        res
    }
}
