impl Solution {
    pub fn max_area(height: Vec<i32>) -> i32 {
        if height.len() < 2 { return 0; }
        let mut l = 0usize;
        let mut r = height.len() - 1;
        let mut ans = 0;
        while l < r {
            ans = ans.max(height[l].min(height[r]) * (r as i32 - l as i32));
            if height[l] < height[r] {
                l += 1;
            } else {
                r -= 1;
            }
        }
        ans
    }
}
