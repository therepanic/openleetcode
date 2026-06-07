impl Solution {
    pub fn combination_sum(mut candidates: Vec<i32>, target: i32) -> Vec<Vec<i32>> {
        candidates.sort_unstable();

        fn dfs(
            start: usize,
            target: i32,
            candidates: &Vec<i32>,
            cur: &mut Vec<i32>,
            res: &mut Vec<Vec<i32>>,
        ) {
            if target == 0 {
                res.push(cur.clone());
                return;
            }

            for i in start..candidates.len() {
                let val = candidates[i];
                if val > target {
                    break;
                }
                cur.push(val);
                dfs(i, target - val, candidates, cur, res);
                cur.pop();
            }
        }

        let mut res = vec![];
        let mut cur = vec![];
        dfs(0, target, &candidates, &mut cur, &mut res);
        res
    }
}
