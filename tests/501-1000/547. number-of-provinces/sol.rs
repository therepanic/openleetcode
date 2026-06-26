impl Solution {
    pub fn find_circle_num(is_connected: Vec<Vec<i32>>) -> i32 {
        let n = is_connected.len();
        let mut visited = vec![false; n];
        let mut count = 0;

        fn dfs(is_connected: &Vec<Vec<i32>>, visited: &mut Vec<bool>, city: usize) {
            let n = is_connected.len();
            for neighbor in 0..n {
                if is_connected[city][neighbor] == 1 && !visited[neighbor] {
                    visited[neighbor] = true;
                    dfs(is_connected, visited, neighbor);
                }
            }
        }

        for city in 0..n {
            if !visited[city] {
                visited[city] = true;
                dfs(&is_connected, &mut visited, city);
                count += 1;
            }
        }

        count
    }
}
