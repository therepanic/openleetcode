impl Solution {
    pub fn crack_safe(n: i32, k: i32) -> String {
        let n = n as usize;
        let k = k as usize;
        
        if n == 1 {
            return (0..k).map(|i| i.to_string()).collect::<String>();
        }
        
        use std::collections::HashMap;
        let mut adj: HashMap<String, Vec<usize>> = HashMap::new();
        let start_node = "0".repeat(n - 1);
        let mut res = String::new();
        
        fn visit(node: &str, adj: &mut HashMap<String, Vec<usize>>, res: &mut String, k: usize, n: usize) {
            adj.entry(node.to_string()).or_insert_with(|| {
                (0..k).rev().collect()
            });
            
            while let Some(digit) = adj.get_mut(node).unwrap().pop() {
                let next_node = format!("{}{}", node, digit)[1..].to_string();
                visit(&next_node, adj, res, k, n);
                res.push_str(&digit.to_string());
            }
        }
        
        visit(&start_node, &mut adj, &mut res, k, n);
        res + &start_node
    }
}
