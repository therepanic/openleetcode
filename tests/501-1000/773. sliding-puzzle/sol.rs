impl Solution {
    pub fn sliding_puzzle(board: Vec<Vec<i32>>) -> i32 {
        let target = "123450".to_string();
        let start: String = board.iter()
            .flatten()
            .map(|&x| (x as u8 + b'0') as char)
            .collect();
        
        let neighbors: std::collections::HashMap<usize, Vec<usize>> = vec![
            (0, vec![1, 3]), (1, vec![0, 2, 4]), (2, vec![1, 5]),
            (3, vec![0, 4]), (4, vec![1, 3, 5]), (5, vec![2, 4])
        ].into_iter().collect();
        
        use std::collections::{VecDeque, HashSet};
        
        let mut queue = VecDeque::new();
        let mut visited = HashSet::new();
        
        queue.push_back((start.clone(), 0));
        visited.insert(start);
        
        while let Some((state, moves)) = queue.pop_front() {
            if state == target {
                return moves;
            }
            
            let zero_index = state.find('0').unwrap();
            
            for &neighbor in &neighbors[&zero_index] {
                let mut new_state: Vec<char> = state.chars().collect();
                new_state.swap(zero_index, neighbor);
                let new_state_str: String = new_state.iter().collect();
                
                if !visited.contains(&new_state_str) {
                    visited.insert(new_state_str.clone());
                    queue.push_back((new_state_str, moves + 1));
                }
            }
        }
        
        -1
    }
}
