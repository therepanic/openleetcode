impl Solution {
    pub fn largest_rectangle_area(heights: Vec<i32>) -> i32 {
        let mut stack: Vec<usize> = Vec::new();
        let mut ans = 0;
        for i in 0..=heights.len() {
            let cur = if i == heights.len() { 0 } else { heights[i] };
            while let Some(&idx) = stack.last() {
                if heights[idx] <= cur {
                    break;
                }
                stack.pop();
                let left = stack.last().copied().map(|x| x as i32).unwrap_or(-1);
                ans = ans.max(heights[idx] * (i as i32 - left - 1));
            }
            stack.push(i);
        }
        ans
    }
}
