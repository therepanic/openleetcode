impl Solution {
    pub fn remove_stones(stones: Vec<Vec<i32>>) -> i32 {
        let n = stones.len();
        let mut matrix: Vec<Vec<usize>> = vec![vec![]; n];
        
        for i in 0..n {
            for j in (i+1)..n {
                if stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1] {
                    matrix[i].push(j);
                    matrix[j].push(i);
                }
            }
        }
        
        let mut visited = vec![false; n];
        let mut components = 0;
        
        fn dfs(idx: usize, matrix: &Vec<Vec<usize>>, visited: &mut Vec<bool>) {
            visited[idx] = true;
            for &nei in &matrix[idx] {
                if !visited[nei] {
                    dfs(nei, matrix, visited);
                }
            }
        }
        
        for i in 0..n {
            if !visited[i] {
                components += 1;
                dfs(i, &matrix, &mut visited);
            }
        }
        
        (n - components) as i32
    }
}
