impl Solution {
    pub fn evaluate(expression: String) -> i32 {
        fn isnum(t: &str) -> bool {
            let c = t.chars().next().unwrap();
            c == '-' || c.is_digit(10)
        }
        
        fn lookup(v: &str, env: &Vec<std::collections::HashMap<String, i32>>) -> i32 {
            for d in env.iter().rev() {
                if let Some(&val) = d.get(v) {
                    return val;
                }
            }
            0
        }
        
        fn toks(s: &str) -> Vec<String> {
            let mut res = Vec::new();
            let mut i = 0;
            let n = s.len();
            let mut bal = 0;
            let mut st = 0;
            let chars: Vec<char> = s.chars().collect();
            while i < n {
                let c = chars[i];
                if c == '(' {
                    bal += 1;
                } else if c == ')' {
                    bal -= 1;
                } else if c == ' ' && bal == 0 {
                    if st < i {
                        res.push(s[st..i].to_string());
                    }
                    st = i + 1;
                }
                i += 1;
            }
            if st < n {
                res.push(s[st..].to_string());
            }
            res
        }
        
        fn evals(e: &str, env: &mut Vec<std::collections::HashMap<String, i32>>) -> i32 {
            if e.chars().next().unwrap() != '(' {
                if isnum(e) {
                    return e.parse::<i32>().unwrap();
                }
                return lookup(e, env);
            }
            let inner = &e[1..e.len()-1];
            let parts = toks(inner);
            let op = &parts[0];
            if op == "add" {
                return evals(&parts[1], env) + evals(&parts[2], env);
            }
            if op == "mult" {
                return evals(&parts[1], env) * evals(&parts[2], env);
            }
            
            let mut loc = std::collections::HashMap::new();
            env.push(loc.clone());
            let mut i = 1;
            while i < parts.len() - 1 {
                let v = parts[i].clone();
                let val = evals(&parts[i+1], env);
                if let Some(last) = env.last_mut() {
                    last.insert(v, val);
                }
                i += 2;
            }
            let ans = evals(&parts[parts.len()-1], env);
            env.pop();
            ans
        }
        
        evals(&expression, &mut Vec::new())
    }
}
