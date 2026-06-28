impl Solution {
    pub fn network_delay_time(times: Vec<Vec<i32>>, n: i32, k: i32) -> i32 {
        use std::collections::BinaryHeap;
        use std::cmp::Reverse;
        
        let n = n as usize;
        let k = k as usize;
        
        let mut adj = vec![vec![]; n + 1];
        for t in &times {
            let u = t[0] as usize;
            let v = t[1] as usize;
            let w = t[2];
            adj[u].push((v, w));
        }
        
        let mut dist = vec![i32::MAX; n + 1];
        dist[k] = 0;
        
        let mut pq = BinaryHeap::new();
        pq.push(Reverse((0, k)));
        
        while let Some(Reverse((dis, node))) = pq.pop() {
            if dis > dist[node] {
                continue;
            }
            for &(adj_node, wt) in &adj[node] {
                let new_dist = dis + wt;
                if new_dist < dist[adj_node] {
                    dist[adj_node] = new_dist;
                    pq.push(Reverse((new_dist, adj_node)));
                }
            }
        }
        
        let mut ans = 0;
        for i in 1..=n {
            if dist[i] == i32::MAX {
                return -1;
            }
            ans = ans.max(dist[i]);
        }
        ans
    }
}
