impl Solution {
    pub fn validate_binary_tree_nodes(n: i32, left_child: Vec<i32>, right_child: Vec<i32>) -> bool {
        let n = n as usize;
        let mut in_degree = vec![0; n];
        for i in 0..n {
            for &child in &[left_child[i], right_child[i]] {
                if child != -1 {
                    let c = child as usize;
                    if c >= n {
                        return false;
                    }
                    in_degree[c] += 1;
                    if in_degree[c] > 1 {
                        return false;
                    }
                }
            }
        }

        let mut root = None;
        for i in 0..n {
            if in_degree[i] == 0 {
                if root.is_some() {
                    return false;
                }
                root = Some(i);
            }
        }
        let root = match root {
            Some(r) => r,
            None => return false,
        };

        let mut queue = std::collections::VecDeque::new();
        let mut visited = vec![false; n];
        queue.push_back(root);
        visited[root] = true;
        let mut count = 1;

        while let Some(node) = queue.pop_front() {
            for &child in &[left_child[node], right_child[node]] {
                if child == -1 {
                    continue;
                }
                let c = child as usize;
                if visited[c] {
                    return false;
                }
                visited[c] = true;
                count += 1;
                queue.push_back(c);
            }
        }
        count == n
    }
}
