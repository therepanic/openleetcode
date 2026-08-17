use std::collections::BinaryHeap;
use std::cmp::Ordering;

#[derive(Eq, PartialEq)]
struct Item {
    dist: i64,
    node: usize,
}

impl Ord for Item {
    fn cmp(&self, other: &Self) -> Ordering {
        other.dist.cmp(&self.dist)
    }
}

impl PartialOrd for Item {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

impl Solution {
    pub fn count_paths(n: i32, roads: Vec<Vec<i32>>) -> i32 {
        let n = n as usize;
        let mut graph = vec![vec![]; n];
        for road in &roads {
            let u = road[0] as usize;
            let v = road[1] as usize;
            let time = road[2] as i64;
            graph[u].push((v, time));
            graph[v].push((u, time));
        }
        
        let mut dist = vec![i64::MAX; n];
        let mut ways = vec![0i64; n];
        dist[0] = 0;
        ways[0] = 1;
        
        let mut pq = BinaryHeap::new();
        pq.push(Item { dist: 0, node: 0 });
        
        let MOD = 1_000_000_007i64;
        
        while let Some(Item { dist: d, node }) = pq.pop() {
            if d > dist[node] { continue; }
            
            for &(neighbor, time) in &graph[node] {
                if dist[node] + time < dist[neighbor] {
                    dist[neighbor] = dist[node] + time;
                    ways[neighbor] = ways[node];
                    pq.push(Item { dist: dist[neighbor], node: neighbor });
                } else if dist[node] + time == dist[neighbor] {
                    ways[neighbor] = (ways[neighbor] + ways[node]) % MOD;
                }
            }
        }
        
        ways[n - 1] as i32
    }
}
