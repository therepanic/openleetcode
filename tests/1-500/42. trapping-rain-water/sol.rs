impl Solution {
    pub fn trap(height: Vec<i32>) -> i32 {
        if height.is_empty() {
            return 0;
        }
        let mut left = 0usize;
        let mut right = height.len() - 1;
        let mut left_max = 0;
        let mut right_max = 0;
        let mut total = 0;

        while left < right {
            left_max = left_max.max(height[left]);
            right_max = right_max.max(height[right]);

            if left_max < right_max {
                total += left_max - height[left];
                left += 1;
            } else {
                total += right_max - height[right];
                right -= 1;
            }
        }

        total
    }
}
