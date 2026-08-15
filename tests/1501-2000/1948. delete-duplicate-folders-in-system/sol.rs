use std::collections::HashMap;

impl Solution {
    pub fn delete_duplicate_folder(paths: Vec<Vec<String>>) -> Vec<Vec<String>> {
        struct Node {
            name: String,
            children: HashMap<String, Node>,
            signature: String,
        }
        
        impl Node {
            fn new(name: &str) -> Self {
                Node {
                    name: name.to_string(),
                    children: HashMap::new(),
                    signature: String::new(),
                }
            }
        }
        
        let mut root = Node::new("");
        
        for path in paths {
            let mut node = &mut root;
            for folder in path {
                if !node.children.contains_key(&folder) {
                    node.children.insert(folder.clone(), Node::new(&folder));
                }
                node = node.children.get_mut(&folder).unwrap();
            }
        }
        
        let mut signature_count: HashMap<String, usize> = HashMap::new();
        
        fn dfs(node: &mut Node, signature_count: &mut HashMap<String, usize>) -> String {
            if node.children.is_empty() {
                node.signature = String::new();
                return String::new();
            }
            
            let mut child_signatures: Vec<String> = Vec::new();
            let mut sorted: Vec<String> = node.children.keys().cloned().collect();
            sorted.sort();
            for name in sorted {
                let child_signature = dfs(node.children.get_mut(&name).unwrap(), signature_count);
                child_signatures.push(format!("{}({})", name, child_signature));
            }
            
            node.signature = child_signatures.join("");
            *signature_count.entry(node.signature.clone()).or_insert(0) += 1;
            node.signature.clone()
        }
        
        dfs(&mut root, &mut signature_count);
        
        let mut result: Vec<Vec<String>> = Vec::new();
        let mut current_path: Vec<String> = Vec::new();
        
        fn dfs2(node: &Node, signature_count: &HashMap<String, usize>, result: &mut Vec<Vec<String>>, current_path: &mut Vec<String>) {
            if !node.children.is_empty() && signature_count.get(&node.signature).unwrap_or(&0) >= &2 {
                return;
            }
            
            current_path.push(node.name.clone());
            result.push(current_path.clone());
            
            let mut sorted: Vec<String> = node.children.keys().cloned().collect();
            sorted.sort();
            for name in sorted {
                dfs2(&node.children[&name], signature_count, result, current_path);
            }
            current_path.pop();
        }
        
        let mut sorted_root: Vec<String> = root.children.keys().cloned().collect();
        sorted_root.sort();
        for name in sorted_root {
            dfs2(&root.children[&name], &signature_count, &mut result, &mut current_path);
        }
        
        result
    }
}
