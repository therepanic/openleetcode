impl Solution {
    pub fn open_lock(deadends: Vec<String>, target: String) -> i32 {
        use std::collections::{VecDeque, HashSet};
        
        if target == "0000" {
            return 0;
        }
        let dead: HashSet<String> = deadends.into_iter().collect();
        if dead.contains("0000") {
            return -1;
        }
        
        let mut moves = 0;
        let mut queue = VecDeque::new();
        let mut visited = HashSet::new();
        queue.push_back("0000".to_string());
        visited.insert("0000".to_string());
        
        while !queue.is_empty() {
            let size = queue.len();
            for _ in 0..size {
                let cur = queue.pop_front().unwrap();
                if cur == target {
                    return moves;
                }
                
                for i in 0..4 {
                    let val = cur.as_bytes()[i] as i32 - '0' as i32;
                    let up = (val + 1) % 10;
                    let down = (val - 1 + 10) % 10;
                    
                    let nxt1 = format!("{}{}{}", &cur[..i], up, &cur[i+1..]);
                    let nxt2 = format!("{}{}{}", &cur[..i], down, &cur[i+1..]);
                    
                    if !dead.contains(&nxt1) && !visited.contains(&nxt1) {
                        visited.insert(nxt1.clone());
                        queue.push_back(nxt1);
                    }
                    if !dead.contains(&nxt2) && !visited.contains(&nxt2) {
                        visited.insert(nxt2.clone());
                        queue.push_back(nxt2);
                    }
                }
            }
            moves += 1;
        }
        -1
    }
}
