impl Solution {
    pub fn shortest_subarray(nums: Vec<i32>, k: i32) -> i32 {
        let n = nums.len();
        let mut prefix = vec![0i64; n + 1];
        for i in 0..n {
            prefix[i + 1] = prefix[i] + nums[i] as i64;
        }
        
        let mut best = (n + 1) as i32;
        let mut dq = std::collections::VecDeque::new();
        for i in 0..prefix.len() {
            while let Some(&front) = dq.front() {
                if prefix[i] - prefix[front] >= k as i64 {
                    best = best.min((i - front) as i32);
                    dq.pop_front();
                } else {
                    break;
                }
            }
            while let Some(&back) = dq.back() {
                if prefix[back] >= prefix[i] {
                    dq.pop_back();
                } else {
                    break;
                }
            }
            dq.push_back(i);
        }
        
        if best == (n + 1) as i32 { -1 } else { best }
    }
}
