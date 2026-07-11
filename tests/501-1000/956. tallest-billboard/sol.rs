impl Solution {
    pub fn tallest_billboard(rods: Vec<i32>) -> i32 {
        let n = rods.len();
        let mid = (n - 1) >> 1;
        
        let mut left: Vec<(i32, i32)> = Vec::new();
        let mut right: Vec<(i32, i32)> = Vec::new();
        
        fn dfs(idx: usize, end: usize, a: i32, b: i32, rods: &Vec<i32>, vals: &mut Vec<(i32, i32)>) {
            if idx == end + 1 {
                vals.push((a - b, b));
                return;
            }
            dfs(idx + 1, end, a, b, rods, vals);
            dfs(idx + 1, end, a + rods[idx], b, rods, vals);
            dfs(idx + 1, end, a, b + rods[idx], rods, vals);
        }
        
        dfs(0, mid, 0, 0, &rods, &mut left);
        dfs(mid + 1, n - 1, 0, 0, &rods, &mut right);
        
        left.sort_by(|a, b| a.0.cmp(&b.0).then(b.1.cmp(&a.1)));
        right.sort_by(|a, b| a.0.cmp(&b.0).then(b.1.cmp(&a.1)));
        
        let mut ans = 0;
        let right_diffs: Vec<i32> = right.iter().map(|r| r.0).collect();
        let right_heights: Vec<i32> = right.iter().map(|r| r.1).collect();
        
        for &(d, b) in &left {
            let target = -d;
            let idx = right_diffs.binary_search_by(|&x| {
                if x < target { std::cmp::Ordering::Less }
                else { std::cmp::Ordering::Greater }
            }).unwrap_err();
            if idx < right_diffs.len() && right_diffs[idx] == target {
                ans = ans.max(b + right_heights[idx]);
            }
        }
        ans
    }
}
