impl Solution {
    pub fn valid_path(n: i32, edges: Vec<Vec<i32>>, source: i32, destination: i32) -> bool {
        if source == destination { return true; }
        let mut graph: std::collections::HashMap<i32, Vec<i32>> = std::collections::HashMap::new();
        for edge in edges {
            graph.entry(edge[0]).or_insert(vec![]).push(edge[1]);
            graph.entry(edge[1]).or_insert(vec![]).push(edge[0]);
        }
        let mut queue = std::collections::VecDeque::new();
        let mut visited = std::collections::HashSet::new();
        queue.push_back(source);
        visited.insert(source);
        while let Some(node) = queue.pop_front() {
            if node == destination { return true; }
            if let Some(neighbors) = graph.get(&node) {
                for &neighbor in neighbors {
                    if visited.insert(neighbor) {
                        queue.push_back(neighbor);
                    }
                }
            }
        }
        false
    }
}
