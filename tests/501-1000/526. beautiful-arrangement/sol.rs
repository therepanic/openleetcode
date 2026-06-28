impl Solution {
    pub fn count_arrangement(n: i32) -> i32 {
        let n = n as usize;
        let mut visited = vec![false; n + 1];
        
        fn backtrack(index: usize, n: usize, visited: &mut Vec<bool>) -> i32 {
            if index > n {
                return 1;
            }
            let mut count = 0;
            for i in 1..=n {
                if !visited[i] && (i % index == 0 || index % i == 0) {
                    visited[i] = true;
                    count += backtrack(index + 1, n, visited);
                    visited[i] = false;
                }
            }
            count
        }
        
        backtrack(1, n, &mut visited)
    }
}
