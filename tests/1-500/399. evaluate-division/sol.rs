impl Solution {
    pub fn calc_equation(equations: Vec<Vec<String>>, values: Vec<f32>, queries: Vec<Vec<String>>) -> Vec<f64> {
        use std::collections::{HashMap, HashSet};
        
        let mut g: HashMap<String, HashMap<String, f64>> = HashMap::new();
        for (i, eq) in equations.iter().enumerate() {
            let a = &eq[0];
            let b = &eq[1];
            let v = values[i] as f64;
            g.entry(a.clone()).or_default().insert(b.clone(), v);
            g.entry(b.clone()).or_default().insert(a.clone(), 1.0 / v);
        }
        
        fn dfs(g: &HashMap<String, HashMap<String, f64>>, x: &str, y: &str) -> f64 {
            if !g.contains_key(x) || !g.contains_key(y) {
                return -1.0;
            }
            if x == y {
                return 1.0;
            }
            let mut stack = vec![(x.to_string(), 1.0)];
            let mut visited = HashSet::new();
            while let Some((c, r)) = stack.pop() {
                if c == y {
                    return r;
                }
                visited.insert(c.clone());
                if let Some(neighbors) = g.get(&c) {
                    for (n, w) in neighbors {
                        if !visited.contains(n) {
                            stack.push((n.clone(), r * w));
                        }
                    }
                }
            }
            -1.0
        }
        
        queries.iter().map(|q| dfs(&g, &q[0], &q[1])).collect()
    }
}
