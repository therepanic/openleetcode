impl Solution {
    pub fn moves_to_make_zigzag(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        
        let find_valleys = |mode: usize| -> i32 {
            let mut res = 0;
            for i in 0..n {
                if i % 2 == mode {
                    let left = if i > 0 { nums[i - 1] } else { i32::MAX };
                    let right = if i + 1 < n { nums[i + 1] } else { i32::MAX };
                    let min_neighbor = left.min(right);
                    if nums[i] >= min_neighbor {
                        res += nums[i] - (min_neighbor - 1);
                    }
                }
            }
            res
        };
        
        find_valleys(0).min(find_valleys(1))
    }
}
