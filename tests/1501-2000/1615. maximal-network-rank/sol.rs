impl Solution {
    pub fn maximal_network_rank(n: i32, roads: Vec<Vec<i32>>) -> i32 {
        let n = n as usize;
        let mut a = vec![vec![0; n]; n];
        for road in &roads {
            let u = road[0] as usize;
            let v = road[1] as usize;
            a[u][v] = 1;
            a[v][u] = 1;
        }
        
        let d: Vec<i32> = a.iter().map(|row| row.iter().sum()).collect();
        
        let mut rank = vec![vec![-1; n]; n];
        for i in 0..n {
            for j in 0..n {
                if i != j {
                    rank[i][j] = d[i] + d[j] - a[i][j];
                }
            }
        }
        
        rank.iter().flat_map(|row| row.iter()).max().copied().unwrap_or(-1)
    }
}
