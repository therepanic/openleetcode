impl Solution {
    pub fn max_value_after_reverse(nums: Vec<i32>) -> i32 {
        if nums.len() < 2 {
            return 0;
        }
        
        let mut max_min = i32::MIN;
        let mut min_min = i32::MAX;
        let mut s = 0;
        let mut boundary = i32::MIN;
        
        for i in 0..nums.len() - 1 {
            let a = nums[i];
            let b = nums[i + 1];
            let distance = (a - b).abs();
            boundary = boundary.max(
                ((nums[nums.len() - 1] - a).abs()).max((nums[0] - b).abs()) - distance
            );
            s += distance;
            min_min = min_min.min(a.max(b));
            max_min = max_min.max(a.min(b));
        }
        
        s + (2 * (max_min - min_min)).max(boundary)
    }
}
