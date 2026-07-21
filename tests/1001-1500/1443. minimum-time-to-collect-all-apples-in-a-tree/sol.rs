impl Solution {
    pub fn min_time(n: i32, edges: Vec<Vec<i32>>, has_apple: Vec<bool>) -> i32 {
        let n = n as usize;
        let mut adj = vec![vec![]; n];
        let mut degree = vec![0; n];

        for edge in &edges {
            let u = edge[0] as usize;
            let v = edge[1] as usize;
            adj[u].push(v);
            adj[v].push(u);
            degree[u] += 1;
            degree[v] += 1;
        }

        let mut q = std::collections::VecDeque::new();
        for i in 1..n {
            if degree[i] == 1 && !has_apple[i] {
                q.push_back(i);
            }
        }

        let mut keep = vec![true; n];

        while let Some(u) = q.pop_front() {
            keep[u] = false;

            for &v in &adj[u].clone() {
                degree[v] -= 1;
                if v != 0 && keep[v] && !has_apple[v] && degree[v] == 1 {
                    q.push_back(v);
                }
            }
        }

        let active_nodes = keep.iter().filter(|&&k| k).count() as i32;
        std::cmp::max(0, (active_nodes - 1) * 2)
    }
}
