use std::collections::HashMap;

impl Solution {
    pub fn min_operations_to_flip(expression: String) -> i32 {
        let chars: Vec<char> = expression.chars().collect();
        let n = chars.len();
        let mut loc = HashMap::new();
        let mut stack = vec![];
        for i in (0..n).rev() {
            if chars[i] == ')' { stack.push(i); }
            else if chars[i] == '(' { loc.insert(stack.pop().unwrap(), i); }
        }
        
        fn solve(chars: &[char], loc: &HashMap<usize, usize>, lo: usize, hi: usize) -> (i32, i32) {
            if lo == hi { return ((chars[lo] as u8 - '0' as u8) as i32, 1); }
            if chars[hi] == ')' && loc[&hi] == lo { return solve(chars, loc, lo+1, hi-1); }
            let mid = loc.get(&hi).map(|&x| x - 1).unwrap_or(hi - 1);
            let (v, c) = solve(chars, loc, mid+1, hi);
            let (vv, cc) = solve(chars, loc, lo, mid-1);
            let op = chars[mid];
            let val;
            let chg;
            if op == '|' {
                val = v | vv;
                if v == 0 && vv == 0 { chg = c.min(cc); }
                else if v == 1 && vv == 1 { chg = 1 + c.min(cc); }
                else { chg = 1; }
            } else {
                val = v & vv;
                if v == 0 && vv == 0 { chg = 1 + c.min(cc); }
                else if v == 1 && vv == 1 { chg = c.min(cc); }
                else { chg = 1; }
            }
            (val, chg)
        }
        
        solve(&chars, &loc, 0, n-1).1
    }
}
