impl Solution {
    pub fn subarrays_with_k_distinct(nums: Vec<i32>, k: i32) -> i32 {
        fn at_most(nums: &Vec<i32>, k: i32) -> i32 {
            use std::collections::HashMap;
            let mut freq: HashMap<i32, i32> = HashMap::new();
            let mut count = 0;
            let mut left = 0;
            let n = nums.len();
            let k = k as usize;

            for right in 0..n {
                *freq.entry(nums[right]).or_insert(0) += 1;

                while freq.len() > k {
                    let val = freq.get_mut(&nums[left]).unwrap();
                    if *val > 1 {
                        *val -= 1;
                    } else {
                        freq.remove(&nums[left]);
                    }
                    left += 1;
                }

                count += (right - left + 1) as i32;
            }

            count
        }

        at_most(&nums, k) - at_most(&nums, k - 1)
    }
}
