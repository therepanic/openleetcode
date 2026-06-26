impl Solution {
    pub fn remove_boxes(boxes: Vec<i32>) -> i32 {
        let mut groups: Vec<(i32, usize)> = Vec::new();
        let mut i = 0;
        while i < boxes.len() {
            let color = boxes[i];
            let mut count = 0;
            while i < boxes.len() && boxes[i] == color {
                count += 1;
                i += 1;
            }
            groups.push((color, count));
        }
        
        let n = groups.len();
        let mut dp = vec![vec![vec![0; boxes.len() + 1]; n]; n];
        
        fn dfs(
            groups: &[(i32, usize)],
            l: usize,
            r: usize,
            k: usize,
            dp: &mut Vec<Vec<Vec<i32>>>,
        ) -> i32 {
            if l > r {
                return 0;
            }
            if dp[l][r][k] != 0 {
                return dp[l][r][k];
            }
            
            let color = groups[l].0;
            let count = groups[l].1 + k;
            let mut res = (count * count) as i32 + dfs(groups, l + 1, r, 0, dp);
            
            for i in (l + 1)..=r {
                if groups[i].0 == color {
                    let left = dfs(groups, l + 1, i - 1, 0, dp);
                    let right = dfs(groups, i, r, count, dp);
                    res = res.max(left + right);
                }
            }
            
            dp[l][r][k] = res;
            res
        }
        
        dfs(&groups, 0, n - 1, 0, &mut dp)
    }
}
