impl Solution {
    pub fn min_operations(nums: Vec<i32>, x: i32) -> i32 {
        let sub_sum: i32 = nums.iter().sum::<i32>() - x;
        let n = nums.len();
        let mut opes = n as i32;
        if sub_sum == 0 {
            return n as i32;
        }
        let (mut l, mut r, mut sld_sum) = (0usize, 0usize, 0i32);
        
        while r < n {
            if sld_sum == sub_sum {
                opes = opes.min(n as i32 - (r - l) as i32);
            }
            sld_sum += nums[r];
            while l < r && sld_sum > sub_sum {
                sld_sum -= nums[l];
                l += 1;
            }
            r += 1;
        }

        if sld_sum == sub_sum {
            opes = opes.min(n as i32 - (r - l) as i32);
        }

        if opes == n as i32 { -1 } else { opes }
    }
}
