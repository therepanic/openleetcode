impl Solution {
    pub fn minimize_the_difference(mat: Vec<Vec<i32>>, target: i32) -> i32 {
        let mut mat = mat;
        for row in mat.iter_mut() {
            row.sort();
        }
        let mut dp: std::collections::HashMap<(i32, i32), i32> = std::collections::HashMap::new();
        let mut mini = i32::MAX;
        
        fn dfs(mat: &Vec<Vec<i32>>, dp: &mut std::collections::HashMap<(i32, i32), i32>, mini: &mut i32, i: i32, ans: i32) -> i32 {
            if i < 0 {
                let diff = ans.abs();
                *mini = (*mini).min(diff);
                return diff;
            }
            if let Some(&val) = dp.get(&(i, ans)) {
                return val;
            }
            if ans < 0 && ans.abs() > *mini {
                return i32::MAX / 2;
            }
            let mut take = i32::MAX / 2;
            for z in 0..mat[i as usize].len() {
                if z > 0 && mat[i as usize][z] == mat[i as usize][z-1] {
                    continue;
                }
                take = take.min(dfs(mat, dp, mini, i-1, ans - mat[i as usize][z]));
                if take == 0 {
                    break;
                }
            }
            dp.insert((i, ans), take);
            take
        }
        
        dfs(&mat, &mut dp, &mut mini, (mat.len() as i32) - 1, target)
    }
}
