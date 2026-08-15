impl Solution {
    pub fn count_subgraphs_for_each_diameter(n: i32, edges: Vec<Vec<i32>>) -> Vec<i32> {
        let n = n as usize;
        let mut graph = vec![vec![]; n];
        for e in &edges {
            let u = (e[0] - 1) as usize;
            let v = (e[1] - 1) as usize;
            graph[u].push(v);
            graph[v].push(u);
        }
        let mut answer = vec![0; n - 1];
        for mask in 1..(1usize << n) {
            if mask.count_ones() <= 1 {
                continue;
            }
            let b = mask & mask.wrapping_neg();
            let s = b.trailing_zeros() as usize;
            let mut seen = vec![false; n];
            seen[s] = true;
            let mut cnt = 1;
            let mut q = std::collections::VecDeque::new();
            q.push_back(s);
            while let Some(u) = q.pop_front() {
                for &v in &graph[u] {
                    if (mask >> v) & 1 == 1 && !seen[v] {
                        seen[v] = true;
                        cnt += 1;
                        q.push_back(v);
                    }
                }
            }
            if cnt != mask.count_ones() as usize {
                continue;
            }
            let bfs = |start: usize| -> (usize, i32) {
                let mut dist = vec![-1; n];
                dist[start] = 0;
                let mut q = std::collections::VecDeque::new();
                q.push_back(start);
                let mut last = start;
                while let Some(u) = q.pop_front() {
                    last = u;
                    for &v in &graph[u] {
                        if (mask >> v) & 1 == 1 && dist[v] == -1 {
                            dist[v] = dist[u] + 1;
                            q.push_back(v);
                        }
                    }
                }
                (last, dist[last])
            };
            let (a, _) = bfs(s);
            let (_, d) = bfs(a);
            if d >= 1 {
                answer[(d - 1) as usize] += 1;
            }
        }
        answer
    }
}
