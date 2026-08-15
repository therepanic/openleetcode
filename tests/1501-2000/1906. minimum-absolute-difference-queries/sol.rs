impl Solution {
    pub fn min_difference(nums: Vec<i32>, queries: Vec<Vec<i32>>) -> Vec<i32> {
        let max_val = *nums.iter().max().unwrap_or(&0) as usize;
        let mut p = vec![vec![0; max_val + 1]; nums.len() + 1];
        for j in 0..=max_val { p[0][j] = 0; }
        for i in 0..nums.len() {
            for j in 0..=max_val {
                p[i + 1][j] = p[i][j] + if nums[i] as usize == j { 1 } else { 0 };
            }
        }
        let mut res = Vec::with_capacity(queries.len());
        for q in &queries {
            let (l, r) = (q[0] as usize, q[1] as usize);
            let mut diff = vec![0; max_val + 1];
            for j in 0..=max_val { diff[j] = p[r + 1][j] - p[l][j]; }
            let mut prev = -1i32;
            let mut best = -1i32;
            for j in 0..=max_val {
                if diff[j] > 0 {
                    if prev >= 0 {
                        let diff_val = j as i32 - prev;
                        if best == -1 || diff_val < best { best = diff_val; }
                    }
                    prev = j as i32;
                }
            }
            res.push(best);
        }
        res
    }
}
