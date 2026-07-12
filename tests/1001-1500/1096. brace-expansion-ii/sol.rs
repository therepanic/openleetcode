impl Solution {
    pub fn brace_expansion_ii(expression: String) -> Vec<String> {
        let mut stack: Vec<Vec<String>> = Vec::new();
        let mut res: Vec<String> = Vec::new();
        let mut cur: Vec<String> = Vec::new();
        for v in expression.chars() {
            if v.is_alphabetic() {
                if cur.is_empty() {
                    cur = vec![v.to_string()];
                } else {
                    cur = cur.into_iter().map(|c| c + &v.to_string()).collect();
                }
            } else if v == '{' {
                stack.push(res.clone());
                stack.push(cur.clone());
                res.clear();
                cur.clear();
            } else if v == '}' {
                let pre = stack.pop().unwrap();
                let pre_res = stack.pop().unwrap();
                let mut merged = res.clone();
                merged.extend(cur.clone());
                if pre.is_empty() {
                    cur = merged;
                } else {
                    cur = pre.into_iter()
                        .flat_map(|p| merged.iter().map(move |c| p.clone() + c))
                        .collect();
                }
                res = pre_res;
            } else if v == ',' {
                res.extend(cur.clone());
                cur.clear();
            }
        }
        res.extend(cur);
        res.sort();
        res.dedup();
        res
    }
}
