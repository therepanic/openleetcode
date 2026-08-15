impl Solution {
    pub fn maximum_unique_subarray(nums: Vec<i32>) -> i32 {
        let mut res = 0;
        let mut cur_sum = 0;
        let mut start = 0;
        let k = 10001;
        let mut is_present = vec![false; k];

        for end in 0..nums.len() {
            while is_present[nums[end] as usize] {
                is_present[nums[start] as usize] = false;
                cur_sum -= nums[start];
                start += 1;
            }

            is_present[nums[end] as usize] = true;
            cur_sum += nums[end];

            res = res.max(cur_sum);
        }

        res
    }
}
