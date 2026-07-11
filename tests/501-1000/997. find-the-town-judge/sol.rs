impl Solution {
    pub fn find_judge(n: i32, trust: Vec<Vec<i32>>) -> i32 {
        let n = n as usize;
        let mut indegree = vec![0; n + 1];
        let mut outdegree = vec![0; n + 1];
        for edge in trust {
            let a = edge[0] as usize;
            let b = edge[1] as usize;
            outdegree[a] += 1;
            indegree[b] += 1;
        }
        for i in 1..=n {
            if outdegree[i] == 0 && indegree[i] == n - 1 {
                return i as i32;
            }
        }
        -1
    }
}
