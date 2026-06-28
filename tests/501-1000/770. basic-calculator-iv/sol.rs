use std::collections::HashMap;

impl Solution {
    pub fn basic_calculator_iv(expression: String, evalvars: Vec<String>, evalints: Vec<i32>) -> Vec<String> {
        let mut evalmap = HashMap::new();
        for i in 0..evalvars.len() {
            evalmap.insert(evalvars[i].clone(), evalints[i]);
        }

        let mut tokens: Vec<String> = Vec::new();
        let mut buf = String::new();
        for ch in expression.chars() {
            if ch.is_alphanumeric() {
                buf.push(ch);
            } else {
                if !buf.is_empty() {
                    tokens.push(buf.clone());
                    buf.clear();
                }
                if "+-*()".contains(ch) {
                    tokens.push(ch.to_string());
                }
            }
        }
        if !buf.is_empty() {
            tokens.push(buf);
        }

        let mut vals: Vec<HashMap<String, i32>> = Vec::new();
        let mut ops: Vec<String> = Vec::new();
        let prec: HashMap<String, i32> = [
            ("+".to_string(), 1),
            ("-".to_string(), 1),
            ("*".to_string(), 2),
        ].into();

        macro_rules! apply_op {
            ($vals:expr, $ops:expr) => {
                {
                    let op = $ops.pop().unwrap();
                    let b = $vals.pop().unwrap();
                    let a = $vals.pop().unwrap();
                    $vals.push(match op.as_str() {
                        "+" => Self::add(&a, &b),
                        "-" => Self::sub(&a, &b),
                        _ => Self::mul(&a, &b),
                    });
                }
            };
        }

        for tok in tokens.iter() {
            if tok == "(" {
                ops.push(tok.clone());
            } else if tok == ")" {
                while !ops.is_empty() && ops.last().unwrap() != "(" {
                    apply_op!(vals, ops);
                }
                ops.pop();
            } else if prec.contains_key(tok) {
                let p = prec[tok];
                while !ops.is_empty() && ops.last().unwrap() != "(" && prec[ops.last().unwrap()] >= p {
                    apply_op!(vals, ops);
                }
                ops.push(tok.clone());
            } else {
                vals.push(Self::parse_token(tok, &evalmap));
            }
        }
        while !ops.is_empty() {
            apply_op!(vals, ops);
        }
        let poly = vals.pop().unwrap();

        let mut items: Vec<(Vec<String>, i32)> = Vec::new();
        for (k, v) in poly.iter() {
            if *v != 0 {
                let vars: Vec<String> = if k.is_empty() { vec![] } else { k.split(',').map(|s| s.to_string()).collect() };
                items.push((vars, *v));
            }
        }
        items.sort_by(|a, b| {
            let len_cmp = b.0.len().cmp(&a.0.len());
            if len_cmp != std::cmp::Ordering::Equal { return len_cmp; }
            a.0.join("*").cmp(&b.0.join("*"))
        });

        let mut ans = Vec::new();
        for (vars, coeff) in items {
            if vars.is_empty() {
                ans.push(coeff.to_string());
            } else {
                ans.push(format!("{}*{}", coeff, vars.join("*")));
            }
        }
        ans
    }

    fn make_key(vars: &[String]) -> String {
        let mut sorted = vars.to_vec();
        sorted.sort();
        sorted.join(",")
    }

    fn combine(poly: HashMap<String, i32>) -> HashMap<String, i32> {
        let mut res = HashMap::new();
        for (k, v) in poly {
            if v != 0 {
                *res.entry(k).or_insert(0) += v;
            }
        }
        res.retain(|_, &mut v| v != 0);
        res
    }

    fn add(a: &HashMap<String, i32>, b: &HashMap<String, i32>) -> HashMap<String, i32> {
        let mut res = a.clone();
        for (k, v) in b {
            *res.entry(k.clone()).or_insert(0) += v;
        }
        Self::combine(res)
    }

    fn sub(a: &HashMap<String, i32>, b: &HashMap<String, i32>) -> HashMap<String, i32> {
        let mut res = a.clone();
        for (k, v) in b {
            *res.entry(k.clone()).or_insert(0) -= v;
        }
        Self::combine(res)
    }

    fn mul(a: &HashMap<String, i32>, b: &HashMap<String, i32>) -> HashMap<String, i32> {
        let mut res = HashMap::new();
        for (k1, v1) in a {
            let va: Vec<String> = if k1.is_empty() { vec![] } else { k1.split(',').map(|s| s.to_string()).collect() };
            for (k2, v2) in b {
                let vb: Vec<String> = if k2.is_empty() { vec![] } else { k2.split(',').map(|s| s.to_string()).collect() };
                let mut merged = [va.clone(), vb].concat();
                let key = Self::make_key(&merged);
                *res.entry(key).or_insert(0) += v1 * v2;
            }
        }
        Self::combine(res)
    }

    fn parse_token(tok: &str, evalmap: &HashMap<String, i32>) -> HashMap<String, i32> {
        let mut res = HashMap::new();
        if let Ok(n) = tok.parse::<i32>() {
            res.insert("".to_string(), n);
        } else if let Some(&v) = evalmap.get(tok) {
            res.insert("".to_string(), v);
        } else {
            res.insert(tok.to_string(), 1);
        }
        res
    }
}
