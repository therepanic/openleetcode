impl Solution {
    pub fn combination_sum2(mut candidates: Vec<i32>, target: i32) -> Vec<Vec<i32>> {
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

            let mut i = start;
            while i < candidates.len() {
                if i > start && candidates[i] == candidates[i - 1] {
                    i += 1;
                    continue;
                }
                let val = candidates[i];
                if val > target {
                    break;
                }
                cur.push(val);
                dfs(i + 1, target - val, candidates, cur, res);
                cur.pop();
                i += 1;
            }
        }

        let mut res = vec![];
        let mut cur = vec![];
        dfs(0, target, &candidates, &mut cur, &mut res);
        res
    }
}
