impl Solution {
    pub fn score_of_students(s: String, answers: Vec<i32>) -> i32 {
        use std::collections::HashMap;
        use std::collections::HashSet;
        
        let s_chars: Vec<char> = s.chars().collect();
        let mut memo: HashMap<(usize, usize), HashSet<i32>> = HashMap::new();
        
        fn dp(chars: &Vec<char>, lo: usize, hi: usize, memo: &mut HashMap<(usize, usize), HashSet<i32>>) -> HashSet<i32> {
            if let Some(val) = memo.get(&(lo, hi)) {
                return val.clone();
            }
            if lo + 1 == hi {
                let val = chars[lo].to_digit(10).unwrap() as i32;
                let mut set = HashSet::new();
                set.insert(val);
                memo.insert((lo, hi), set.clone());
                return set;
            }
            let mut result = HashSet::new();
            let mut mid = lo + 1;
            while mid < hi {
                let left = dp(chars, lo, mid, memo);
                let right = dp(chars, mid + 1, hi, memo);
                for &x in &left {
                    for &y in &right {
                        if chars[mid] == '+' && x + y <= 1000 {
                            result.insert(x + y);
                        } else if chars[mid] == '*' && x * y <= 1000 {
                            result.insert(x * y);
                        }
                    }
                }
                mid += 2;
            }
            memo.insert((lo, hi), result.clone());
            result
        }
        
        // evaluate target respecting precedence
        let mut nums: Vec<i32> = Vec::new();
        let mut ops: Vec<char> = Vec::new();
        for &c in &s_chars {
            if c.is_digit(10) {
                nums.push(c.to_digit(10).unwrap() as i32);
            } else if c == '+' || c == '*' {
                while !ops.is_empty() && Self::precedence(ops[ops.len()-1]) >= Self::precedence(c) {
                    Self::apply(&mut nums, &mut ops);
                }
                ops.push(c);
            }
        }
        while !ops.is_empty() {
            Self::apply(&mut nums, &mut ops);
        }
        let target = nums[nums.len()-1];
        
        let cand = dp(&s_chars, 0, s_chars.len(), &mut memo);
        let mut score = 0;
        for x in answers {
            if x == target {
                score += 5;
            } else if cand.contains(&x) {
                score += 2;
            }
        }
        score
    }
    
    fn precedence(c: char) -> i32 {
        if c == '*' { 2 } else { 1 }
    }
    
    fn apply(nums: &mut Vec<i32>, ops: &mut Vec<char>) {
        let b = nums.pop().unwrap();
        let a = nums.pop().unwrap();
        let op = ops.pop().unwrap();
        nums.push(if op == '+' { a + b } else { a * b });
    }
}
