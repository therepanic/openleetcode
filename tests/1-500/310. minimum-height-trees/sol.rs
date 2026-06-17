impl Solution {
    pub fn find_min_height_trees(n: i32, edges: Vec<Vec<i32>>) -> Vec<i32> {
        if n < 3 {
            return (0..n).collect();
        }

        let mut adjacency_list: Vec<std::collections::HashSet<i32>> = vec![std::collections::HashSet::new(); n as usize];
        for edge in edges {
            let a = edge[0] as usize;
            let b = edge[1] as usize;
            adjacency_list[a].insert(b as i32);
            adjacency_list[b].insert(a as i32);
        }

        let mut leaves: Vec<i32> = (0..n).filter(|&i| adjacency_list[i as usize].len() == 1).collect();
        let mut remaining_nodes = n;

        while remaining_nodes > 2 {
            remaining_nodes -= leaves.len() as i32;
            let mut new_leaves = Vec::new();
            for &leaf in &leaves {
                let neighbor = *adjacency_list[leaf as usize].iter().next().unwrap();
                adjacency_list[neighbor as usize].remove(&leaf);
                if adjacency_list[neighbor as usize].len() == 1 {
                    new_leaves.push(neighbor);
                }
            }
            leaves = new_leaves;
        }

        leaves
    }
}
