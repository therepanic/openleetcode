impl Solution {
    pub fn strange_printer(s: String) -> i32 {
        let chars: Vec<char> = s.chars().collect();
        let n = chars.len();
        let mut memo = vec![vec![-1; n]; n];
        
        fn min_turns(chars: &[char], start: i32, end: i32, memo: &mut Vec<Vec<i32>>) -> i32 {
            if start > end {
                return 0;
            }
            
            let start_idx = start as usize;
            let end_idx = end as usize;
            
            if memo[start_idx][end_idx] != -1 {
                return memo[start_idx][end_idx];
            }
            
            let mut res = min_turns(chars, start, end - 1, memo) + 1;
            
            for middle in start..end {
                let mid_idx = middle as usize;
                if chars[mid_idx] == chars[end_idx] {
                    let val = min_turns(chars, start, middle, memo) + min_turns(chars, middle + 1, end - 1, memo);
                    if val < res {
                        res = val;
                    }
                }
            }
            
            memo[start_idx][end_idx] = res;
            res
        }
        
        min_turns(&chars, 0, n as i32 - 1, &mut memo)
    }
}
