impl Solution {
    pub fn can_see_persons_count(heights: Vec<i32>) -> Vec<i32> {
        let n = heights.len();
        let mut result = vec![0; n];
        let mut stack: Vec<i32> = Vec::new();

        for i in (0..n).rev() {
            let height = heights[i];
            let mut visibility = 0;

            while !stack.is_empty() && height > *stack.last().unwrap() {
                stack.pop();
                visibility += 1;
            }

            if !stack.is_empty() {
                visibility += 1;
            }

            result[i] = visibility;
            stack.push(height);
        }

        result
    }
}
