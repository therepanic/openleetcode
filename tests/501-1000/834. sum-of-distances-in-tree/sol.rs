impl Solution {
    pub fn sum_of_distances_in_tree(n: i32, edges: Vec<Vec<i32>>) -> Vec<i32> {
        let n = n as usize;
        let mut adj = vec![vec![]; n];
        for e in &edges {
            let u = e[0] as usize;
            let v = e[1] as usize;
            adj[u].push(v);
            adj[v].push(u);
        }
        
        let mut count = vec![1i32; n];
        let mut ans = vec![0i32; n];
        
        fn dfs_in(node: usize, parent: i32, adj: &Vec<Vec<usize>>, count: &mut Vec<i32>, ans: &mut Vec<i32>) {
            for &child in &adj[node] {
                if child as i32 != parent {
                    dfs_in(child, node as i32, adj, count, ans);
                    count[node] += count[child];
                    ans[node] += ans[child] + count[child];
                }
            }
        }
        
        fn dfs_out(node: usize, parent: i32, adj: &Vec<Vec<usize>>, count: &Vec<i32>, ans: &mut Vec<i32>, n: usize) {
            for &child in &adj[node] {
                if child as i32 != parent {
                    ans[child] = ans[node] - count[child] + (n as i32 - count[child]);
                    dfs_out(child, node as i32, adj, count, ans, n);
                }
            }
        }
        
        dfs_in(0, -1, &adj, &mut count, &mut ans);
        dfs_out(0, -1, &adj, &count, &mut ans, n);
        
        ans
    }
}
