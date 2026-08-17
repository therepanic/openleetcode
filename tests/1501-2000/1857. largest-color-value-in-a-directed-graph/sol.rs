impl Solution {
    pub fn largest_path_value(colors: String, edges: Vec<Vec<i32>>) -> i32 {
        const INF: i32 = i32::MAX;
        let n = colors.len();
        let mut adj = vec![vec![]; n];
        for e in edges {
            adj[e[0] as usize].push(e[1] as usize);
        }
        
        let mut count = vec![vec![0; 26]; n];
        let mut vis = vec![0; n];
        
        fn dfs(node: usize, adj: &Vec<Vec<usize>>, count: &mut Vec<Vec<i32>>, vis: &mut Vec<i32>, colors: &[u8]) -> i32 {
            if vis[node] == 1 { return INF; }
            if vis[node] == 2 { return count[node][(colors[node] - b'a') as usize]; }
            
            vis[node] = 1;
            for &nxt in &adj[node] {
                let res = dfs(nxt, adj, count, vis, colors);
                if res == INF { return INF; }
                for c in 0..26 {
                    count[node][c] = count[node][c].max(count[nxt][c]);
                }
            }
            
            let col = (colors[node] - b'a') as usize;
            count[node][col] += 1;
            vis[node] = 2;
            count[node][col]
        }
        
        let mut ans = 0;
        for i in 0..n {
            let val = dfs(i, &adj, &mut count, &mut vis, colors.as_bytes());
            if val == INF { return -1; }
            ans = ans.max(val);
        }
        
        ans
    }
}
