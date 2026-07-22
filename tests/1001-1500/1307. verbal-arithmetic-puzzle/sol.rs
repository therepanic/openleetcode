impl Solution {
    pub fn is_solvable(words: Vec<String>, result: String) -> bool {
        use std::collections::{HashMap, HashSet};
        
        let mut zeroes = HashSet::new();
        let mut m = 0;
        for word in &words {
            if word.len() > 1 {
                zeroes.insert(word.as_bytes()[0] as char);
            }
            m = m.max(word.len());
        }
        if m > result.len() {
            return false;
        }
        
        let mut d: HashMap<char, i32> = HashMap::new();
        for word in words.iter().chain(std::iter::once(&result)) {
            for c in word.chars() {
                d.insert(c, -1);
            }
        }
        
        let words_rev: Vec<String> = words.iter().map(|w| w.chars().rev().collect()).collect();
        let result_rev: String = result.chars().rev().collect();
        let r = result_rev.len();
        let n = words_rev.len();
        let mut visited: HashSet<i32> = (0..10).collect();
        
        fn rec(
            wi: usize,
            ri: usize,
            rem: i32,
            words_rev: &[String],
            result_rev: &str,
            d: &mut HashMap<char, i32>,
            zeroes: &HashSet<char>,
            visited: &mut HashSet<i32>,
            r: usize,
            n: usize,
        ) -> bool {
            if ri == r {
                return rem == 0 && (result_rev.len() == 1 || d[&result_rev.chars().nth(r-1).unwrap()] != 0);
            }
            let r_char = result_rev.chars().nth(ri).unwrap();
            if wi == n {
                let dv = d[&r_char];
                if dv != -1 {
                    if dv != rem % 10 {
                        return false;
                    } else {
                        return rec(0, ri + 1, rem / 10, words_rev, result_rev, d, zeroes, visited, r, n);
                    }
                } else if visited.contains(&(rem % 10)) {
                    let val = rem % 10;
                    visited.remove(&val);
                    d.insert(r_char, val);
                    let ret = rec(wi, ri, rem, words_rev, result_rev, d, zeroes, visited, r, n);
                    d.insert(r_char, -1);
                    visited.insert(val);
                    if ret {
                        return true;
                    }
                }
                return false;
            }
            if words_rev[wi].len() <= ri {
                return rec(wi + 1, ri, rem, words_rev, result_rev, d, zeroes, visited, r, n);
            }
            let w_char = words_rev[wi].chars().nth(ri).unwrap();
            let dw = d[&w_char];
            if dw != -1 {
                return rec(wi + 1, ri, rem + dw, words_rev, result_rev, d, zeroes, visited, r, n);
            }
            for val in 0..10 {
                if visited.contains(&val) && (val != 0 || !zeroes.contains(&w_char)) {
                    visited.remove(&val);
                    d.insert(w_char, val);
                    let ret = rec(wi + 1, ri, rem + val, words_rev, result_rev, d, zeroes, visited, r, n);
                    d.insert(w_char, -1);
                    visited.insert(val);
                    if ret {
                        return true;
                    }
                }
            }
            false
        }
        
        rec(0, 0, 0, &words_rev, &result_rev, &mut d, &zeroes, &mut visited, r, n)
    }
}
