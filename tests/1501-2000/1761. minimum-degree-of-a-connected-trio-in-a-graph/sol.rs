impl Solution {
    pub fn min_trio_degree(n: i32, edges: Vec<Vec<i32>>) -> i32 {
        let n = n as usize;
        let mut adj = vec![vec![0i32; n+1]; n+1];
        let mut deg = vec![0i32; n+1];
        for e in &edges {
            let u = e[0] as usize;
            let v = e[1] as usize;
            adj[u][v] = 1;
            adj[v][u] = 1;
            deg[u] += 1;
            deg[v] += 1;
        }
        let mut ans = i32::MAX;
        for e in &edges {
            let u = e[0] as usize;
            let v = e[1] as usize;
            for w in 1..=n {
                if adj[u][w] == 1 && adj[v][w] == 1 {
                    ans = ans.min(deg[u] + deg[v] + deg[w] - 6);
                }
            }
        }
        if ans == i32::MAX { -1 } else { ans }
    }
}
