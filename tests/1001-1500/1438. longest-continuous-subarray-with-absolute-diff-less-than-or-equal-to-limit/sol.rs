impl Solution {
    pub fn longest_subarray(nums: Vec<i32>, limit: i32) -> i32 {
        let mut maxq: std::collections::VecDeque<usize> = std::collections::VecDeque::new();
        let mut minq: std::collections::VecDeque<usize> = std::collections::VecDeque::new();
        let mut left = 0;
        let mut max_len = 1;
        for right in 0..nums.len() {
            while let Some(&back) = maxq.back() {
                if nums[back] <= nums[right] {
                    maxq.pop_back();
                } else {
                    break;
                }
            }
            maxq.push_back(right);
            while let Some(&back) = minq.back() {
                if nums[back] >= nums[right] {
                    minq.pop_back();
                } else {
                    break;
                }
            }
            minq.push_back(right);
            while nums[*maxq.front().unwrap()] - nums[*minq.front().unwrap()] > limit {
                left += 1;
                if *maxq.front().unwrap() < left {
                    maxq.pop_front();
                }
                if *minq.front().unwrap() < left {
                    minq.pop_front();
                }
            }
            max_len = max_len.max((right - left + 1) as i32);
        }
        max_len
    }
}
