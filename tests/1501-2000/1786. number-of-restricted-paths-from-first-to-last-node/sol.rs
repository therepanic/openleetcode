impl Solution {
    pub fn count_restricted_paths(n: i32, edges: Vec<Vec<i32>>) -> i32 {
        let n = n as usize;
        const MOD: i64 = 1_000_000_007;
        let mut graph: Vec<Vec<(usize, i32)>> = vec![vec![]; n + 1];
        for e in &edges {
            let (u, v, w) = (e[0] as usize, e[1] as usize, e[2]);
            graph[u].push((v, w));
            graph[v].push((u, w));
        }

        let mut dist = vec![i64::MAX; n + 1];
        dist[n] = 0;
        use std::collections::BinaryHeap;
        use std::cmp::Reverse;
        let mut heap: BinaryHeap<(Reverse<i64>, usize)> = BinaryHeap::new();
        heap.push((Reverse(0), n));
        while let Some((Reverse(d), node)) = heap.pop() {
            if d > dist[node] { continue }
            for &(next, w) in &graph[node] {
                let nd = d + w as i64;
                if nd < dist[next] {
                    dist[next] = nd;
                    heap.push((Reverse(nd), next));
                }
            }
        }

        let mut dp = vec![0i64; n + 1];
        dp[n] = 1;
        let mut nodes: Vec<usize> = (1..=n).collect();
        nodes.sort_by(|&a, &b| dist[a].cmp(&dist[b]));
        for u in nodes {
            for &(v, _) in &graph[u] {
                if dist[u] > dist[v] {
                    dp[u] = (dp[u] + dp[v]) % MOD;
                }
            }
        }
        (dp[1] % MOD) as i32
    }
}
