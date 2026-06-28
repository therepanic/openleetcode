impl Solution {
    pub fn find_redundant_connection(edges: Vec<Vec<i32>>) -> Vec<i32> {
        let n = edges.len();
        let mut matrix = vec![vec![]; n + 1];
        for edge in &edges {
            let a = edge[0] as usize;
            let b = edge[1] as usize;
            matrix[a].push(b);
            matrix[b].push(a);
        }

        let mut visited = std::collections::HashSet::new();
        let mut path = std::collections::HashSet::new();
        let mut cycle_start: i32 = -1;

        fn dfs(
            i: usize,
            parent: i32,
            matrix: &Vec<Vec<usize>>,
            visited: &mut std::collections::HashSet<usize>,
            path: &mut std::collections::HashSet<usize>,
            cycle_start: &mut i32,
        ) -> bool {
            if visited.contains(&i) {
                return false;
            }
            visited.insert(i);
            for &node in &matrix[i] {
                if !visited.contains(&node) {
                    if dfs(node, i as i32, matrix, visited, path, cycle_start) {
                        if *cycle_start != -1 {
                            path.insert(node);
                        }
                        if node as i32 == *cycle_start {
                            *cycle_start = -1;
                        }
                        return true;
                    }
                } else if node as i32 != parent {
                    path.insert(node);
                    *cycle_start = node as i32;
                    return true;
                }
            }
            false
        }

        for i in (1..=n).rev() {
            if dfs(i, -1, &matrix, &mut visited, &mut path, &mut cycle_start) {
                break;
            }
        }

        for k in (0..n).rev() {
            let a = edges[k][0] as usize;
            let b = edges[k][1] as usize;
            if path.contains(&a) && path.contains(&b) {
                return vec![a as i32, b as i32];
            }
        }
        vec![]
    }
}
