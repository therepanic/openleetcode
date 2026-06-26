impl Solution {
    pub fn find_unsorted_subarray(nums: Vec<i32>) -> i32 {
        let mut sorted_nums = nums.clone();
        sorted_nums.sort();
        let mut start = nums.len();
        let mut end = 0;

        for i in 0..nums.len() {
            if nums[i] != sorted_nums[i] {
                start = start.min(i);
                end = end.max(i);
            }
        }

        if end >= start {
            (end - start + 1) as i32
        } else {
            0
        }
    }
}
