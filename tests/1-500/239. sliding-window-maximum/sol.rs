impl Solution {
    pub fn max_sliding_window(nums: Vec<i32>, k: i32) -> Vec<i32> {
        let k = k as usize;
        let mut res = Vec::new();
        let mut q = std::collections::VecDeque::new();
        for idx in 0..nums.len() {
            let num = nums[idx];
            while let Some(&back) = q.back() {
                if back < num {
                    q.pop_back();
                } else {
                    break;
                }
            }
            q.push_back(num);
            if idx >= k && nums[idx - k] == *q.front().unwrap() {
                q.pop_front();
            }
            if idx >= k - 1 {
                res.push(*q.front().unwrap());
            }
        }
        res
    }
}
