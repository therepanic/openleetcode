impl Solution {
    pub fn min_cost(max_time: i32, edges: Vec<Vec<i32>>, passing_fees: Vec<i32>) -> i32 {
        let n = passing_fees.len();
        let mut graph = vec![Vec::new(); n];
        for e in &edges {
            let u = e[0] as usize;
            let v = e[1] as usize;
            let t = e[2];
            graph[u].push((v, t));
            graph[v].push((u, t));
        }
        let mut times = vec![max_time + 1; n];
        let mut costs = vec![i32::MAX; n];
        times[0] = 0;
        costs[0] = passing_fees[0];
        // Use BinaryHeap with custom ordering (cost, time)
        use std::collections::BinaryHeap;
        use std::cmp::Reverse;
        #[derive(Eq, PartialEq)]
        struct Item { cost: i32, time: i32, city: usize }
        impl Ord for Item {
            fn cmp(&self, other: &Self) -> std::cmp::Ordering {
                (other.cost, other.time).cmp(&(self.cost, self.time))
            }
        }
        impl PartialOrd for Item {
            fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
                Some(self.cmp(other))
            }
        }
        let mut pq = BinaryHeap::new();
        pq.push(Item { cost: passing_fees[0], time: 0, city: 0 });
        while let Some(Item { cost, time, city }) = pq.pop() {
            if city == n - 1 { return cost; }
            for &(nxt, t) in &graph[city] {
                let nt = time + t;
                if nt > max_time { continue; }
                let nc = cost + passing_fees[nxt];
                if nc < costs[nxt] || nt < times[nxt] {
                    costs[nxt] = nc;
                    times[nxt] = nt;
                    pq.push(Item { cost: nc, time: nt, city: nxt });
                }
            }
        }
        -1
    }
}
