impl Solution {
    pub fn num_similar_groups(strs: Vec<String>) -> i32 {
        fn check_similarity(str1: &str, str2: &str) -> bool {
            let mut diff = 0;
            let bytes1 = str1.as_bytes();
            let bytes2 = str2.as_bytes();
            for i in 0..bytes1.len() {
                if bytes1[i] != bytes2[i] {
                    diff += 1;
                }
            }
            diff == 0 || diff == 2
        }
        
        fn dfs(node: usize, matrix: &Vec<Vec<usize>>, visited: &mut Vec<bool>) {
            if visited[node] {
                return;
            }
            visited[node] = true;
            for &nei in &matrix[node] {
                if !visited[nei] {
                    dfs(nei, matrix, visited);
                }
            }
        }
        
        let n = strs.len();
        let mut matrix = vec![vec![]; n];
        
        for i in 0..n {
            for j in 0..n {
                if check_similarity(&strs[i], &strs[j]) {
                    matrix[i].push(j);
                    matrix[j].push(i);
                }
            }
        }
        
        let mut count = 0;
        let mut visited = vec![false; n];
        for start in 0..n {
            if !visited[start] {
                dfs(start, &matrix, &mut visited);
                count += 1;
            }
        }
        
        count
    }
}
