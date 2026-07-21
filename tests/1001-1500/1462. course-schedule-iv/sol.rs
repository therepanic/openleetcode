impl Solution {
    pub fn check_if_prerequisite(n: i32, prerequisites: Vec<Vec<i32>>, queries: Vec<Vec<i32>>) -> Vec<bool> {
        let n = n as usize;
        let mut reach = vec![vec![false; n]; n];
        for edge in prerequisites { reach[edge[0] as usize][edge[1] as usize] = true; }
        for k in 0..n {
            for i in 0..n {
                if !reach[i][k] { continue; }
                for j in 0..n { reach[i][j] |= reach[k][j]; }
            }
        }
        queries.into_iter().map(|query| reach[query[0] as usize][query[1] as usize]).collect()
    }
}
