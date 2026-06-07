impl Solution {
    pub fn combine(n: i32, k: i32) -> Vec<Vec<i32>> {
        let mut res = Vec::new();
        let mut cur = Vec::new();
        fn dfs(start: i32, n: i32, k: i32, cur: &mut Vec<i32>, res: &mut Vec<Vec<i32>>) {
            if cur.len() as i32 == k {
                res.push(cur.clone());
                return;
            }
            for i in start..=n {
                cur.push(i);
                dfs(i + 1, n, k, cur, res);
                cur.pop();
            }
        }
        dfs(1, n, k, &mut cur, &mut res);
        res
    }
}
