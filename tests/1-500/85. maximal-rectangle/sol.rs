impl Solution {
    pub fn maximal_rectangle(matrix: Vec<Vec<char>>) -> i32 {
        if matrix.is_empty() || matrix[0].is_empty() {
            return 0;
        }
        let cols = matrix[0].len();
        let mut heights = vec![0; cols];
        let mut ans = 0;

        fn largest(heights: &Vec<i32>) -> i32 {
            let mut stack: Vec<usize> = Vec::new();
            let mut best = 0;
            for i in 0..=heights.len() {
                let cur = if i == heights.len() { 0 } else { heights[i] };
                while let Some(&idx) = stack.last() {
                    if heights[idx] <= cur {
                        break;
                    }
                    stack.pop();
                    let left = stack.last().copied().map(|x| x as i32).unwrap_or(-1);
                    best = best.max(heights[idx] * (i as i32 - left - 1));
                }
                stack.push(i);
            }
            best
        }

        for row in matrix {
            for c in 0..cols {
                heights[c] = if row[c] == '1' { heights[c] + 1 } else { 0 };
            }
            ans = ans.max(largest(&heights));
        }
        ans
    }
}
