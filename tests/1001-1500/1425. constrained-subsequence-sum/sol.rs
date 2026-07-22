impl Solution {
    pub fn constrained_subset_sum(nums: Vec<i32>, k: i32) -> i32 {
        use std::collections::VecDeque;
        let mut q: VecDeque<(i32, i32)> = VecDeque::new();
        let mut res = i32::MIN;
        for (i, &num) in nums.iter().enumerate() {
            let i = i as i32;
            let total = if q.is_empty() { num } else { num + q.front().unwrap().1 };
            res = res.max(total);
            while let Some(&back) = q.back() {
                if total >= back.1 {
                    q.pop_back();
                } else {
                    break;
                }
            }
            if total > 0 {
                q.push_back((i, total));
            }
            if let Some(&front) = q.front() {
                if front.0 == i - k {
                    q.pop_front();
                }
            }
        }
        res
    }
}
