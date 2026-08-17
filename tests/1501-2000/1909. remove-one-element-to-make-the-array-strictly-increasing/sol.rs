impl Solution {
    pub fn can_be_increasing(nums: Vec<i32>) -> bool {
        let n = nums.len();
        if n <= 2 { return true; }
        let mut removed = false;
        let mut prev = nums[0];
        for i in 1..n {
            if prev >= nums[i] {
                if removed { return false; }
                removed = true;
                if i == 1 || nums[i - 2] < nums[i] { prev = nums[i]; }
            } else { prev = nums[i]; }
        }
        return true;
        /*
        let mut idx = -1i32;
        
        for i in 0..n - 1 {
            if nums[i] >= nums[i + 1] {
                idx = i as i32;
                break;
            }
        }
        
        let mut flag = true;
        for i in (idx + 1) as usize..n - 1 {
            if nums[i] >= nums[i + 1] {
                flag = false;
                break;
            }
        }
        
        if (idx == 0 || idx as usize == n - 1) && flag { return true; }
        if idx - 1 >= 0 && idx + 1 < n as i32 && nums[(idx - 1) as usize] < nums[(idx + 1) as usize] && flag { return true; }
        
        for i in (0..n - 1).rev() {
            if nums[i + 1] <= nums[i] {
                idx = i as i32;
                break;
            }
        }
        
        flag = true;
        for i in (0..idx as usize - 1).rev() {
            if nums[i + 1] <= nums[i] {
                flag = false;
                break;
            }
        }
        
        if (idx == 0 || idx as usize == n - 1) && flag { return true; }
        if idx - 1 >= 0 && idx + 1 < n as i32 && nums[(idx - 1) as usize] >= nums[(idx + 1) as usize] { return false; }
        return flag; */
    }
}
