impl Solution {
    pub fn unhappy_friends(n: i32, preferences: Vec<Vec<i32>>, pairs: Vec<Vec<i32>>) -> i32 {
        let n = n as usize;
        let mut graph = vec![0; n];
        for p in &pairs {
            let u = p[0] as usize;
            let v = p[1] as usize;
            graph[u] = v;
            graph[v] = u;
        }

        let mut rank = vec![vec![0; n]; n];
        for i in 0..n {
            for (j, &e) in preferences[i].iter().enumerate() {
                rank[i][e as usize] = j;
            }
        }

        let mut ans = 0;
        for u in 0..n {
            let v = graph[u];
            let mut unhappy = false;
            for &a in &preferences[u] {
                let a = a as usize;
                if a == v { break; }
                let av = graph[a];
                if rank[a][u] < rank[a][av] {
                    unhappy = true;
                    break;
                }
            }
            if unhappy { ans += 1; }
        }
        ans
    }
}
