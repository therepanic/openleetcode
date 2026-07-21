impl Solution {
    pub fn find_the_city(n: i32, edges: Vec<Vec<i32>>, distance_threshold: i32) -> i32 {
        let n = n as usize;
        let inf = i32::MAX / 2;
        let mut matrix = vec![vec![inf; n]; n];
        
        for i in 0..n {
            matrix[i][i] = 0;
        }
        
        for edge in &edges {
            let u = edge[0] as usize;
            let v = edge[1] as usize;
            let w = edge[2];
            matrix[u][v] = w;
            matrix[v][u] = w;
        }
        
        for via in 0..n {
            for i in 0..n {
                for j in 0..n {
                    if matrix[i][via] + matrix[via][j] < matrix[i][j] {
                        matrix[i][j] = matrix[i][via] + matrix[via][j];
                    }
                }
            }
        }
        
        let mut min_reachable = n as i32;
        let mut ans: i32 = -1;
        
        for i in 0..n {
            let count = (0..n).filter(|&j| matrix[i][j] <= distance_threshold).count() as i32;
            if count <= min_reachable {
                min_reachable = count;
                ans = i as i32;
            }
        }
        
        ans
    }
}
