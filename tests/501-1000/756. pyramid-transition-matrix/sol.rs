impl Solution {
    pub fn pyramid_transition(bottom: String, allowed: Vec<String>) -> bool {
        use std::collections::{HashMap, HashSet};
        
        let mut tab: HashMap<(u8, u8), HashSet<u8>> = HashMap::new();
        for a in allowed.iter() {
            let bytes = a.as_bytes();
            let key = (bytes[0], bytes[1]);
            tab.entry(key).or_insert(HashSet::new()).insert(bytes[2]);
        }
        
        fn add_neighbor(node: &[u8], tab: &HashMap<(u8, u8), HashSet<u8>>) -> Vec<Vec<u8>> {
            let mut res: Vec<Vec<u8>> = vec![vec![]];
            for i in 1..node.len() {
                let key = (node[i-1], node[i]);
                match tab.get(&key) {
                    Some(chars) if !chars.is_empty() => {
                        let mut new_res = Vec::new();
                        for r in &res {
                            for &c in chars {
                                let mut nr = r.clone();
                                nr.push(c);
                                new_res.push(nr);
                            }
                        }
                        res = new_res;
                    }
                    _ => return Vec::new(),
                }
            }
            res
        }
        
        fn dfs(node: Vec<u8>, tab: &HashMap<(u8, u8), HashSet<u8>>, visited: &mut HashSet<Vec<u8>>) -> bool {
            if node.len() == 1 {
                return true;
            }
            if visited.contains(&node) {
                return false;
            }
            
            let neighbors = add_neighbor(&node, tab);
            for nxt in neighbors {
                if dfs(nxt, tab, visited) {
                    return true;
                }
            }
            
            visited.insert(node);
            false
        }
        
        let mut visited: HashSet<Vec<u8>> = HashSet::new();
        let bytes: Vec<u8> = bottom.bytes().collect();
        dfs(bytes, &tab, &mut visited)
    }
}
