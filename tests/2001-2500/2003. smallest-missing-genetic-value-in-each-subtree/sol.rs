impl Solution {
    pub fn smallest_missing_value_subtree(parents: Vec<i32>, nums: Vec<i32>) -> Vec<i32> {
        let n = parents.len();
        let mut graph = vec![Vec::new(); n];
        let mut node_one = -1;
        let mut root = -1;
        
        for child in 0..n {
            if parents[child] == -1 {
                root = child as i32;
            } else {
                graph[parents[child] as usize].push(child);
            }
            if nums[child] == 1 {
                node_one = child as i32;
            }
        }
        
        let mut results = vec![1; n];
        if node_one == -1 {
            return results;
        }
        
        let mut seen = vec![false; 100002];
        let mut current = node_one;
        let mut missing = 1;
        
        while current != -1 {
            Self::mark_seen(current as usize, &graph, &mut seen, &nums);
            while missing < 100002 && seen[missing] {
                missing += 1;
            }
            results[current as usize] = missing as i32;
            current = parents[current as usize];
        }
        
        results
    }
    
    fn mark_seen(node: usize, graph: &Vec<Vec<usize>>, seen: &mut Vec<bool>, nums: &Vec<i32>) {
        if !seen[nums[node] as usize] {
            seen[nums[node] as usize] = true;
            for &child in &graph[node] {
                Self::mark_seen(child, graph, seen, nums);
            }
        }
    }
}
