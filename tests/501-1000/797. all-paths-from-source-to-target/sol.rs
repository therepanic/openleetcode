impl Solution {
    pub fn all_paths_source_target(graph: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let target = (graph.len() - 1) as i32;
        let mut result = vec![];
        let mut queue = vec![(0, vec![0])];
        
        while let Some((node, path)) = queue.pop() {
            if node == target {
                result.push(path);
                continue;
            }
            
            for &neighbor in &graph[node as usize] {
                let mut new_path = path.clone();
                new_path.push(neighbor);
                queue.insert(0, (neighbor, new_path));
            }
        }
        
        result
    }
}
