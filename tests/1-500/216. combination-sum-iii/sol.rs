impl Solution {
    pub fn combination_sum3(k: i32, n: i32) -> Vec<Vec<i32>> {
        fn backtrack(start: i32, path: &mut Vec<i32>, target: i32, k: i32, res: &mut Vec<Vec<i32>>) {
            if target == 0 && k == 0 {
                res.push(path.clone());
                return;
            }
            for i in start..=9 {
                if i > target || k <= 0 {
                    break;
                }
                path.push(i);
                backtrack(i + 1, path, target - i, k - 1, res);
                path.pop();
            }
        }
        let mut res = Vec::new();
        backtrack(1, &mut Vec::new(), n, k, &mut res);
        res
    }
}
