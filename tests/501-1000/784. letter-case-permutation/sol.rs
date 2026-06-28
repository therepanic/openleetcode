impl Solution {
    pub fn letter_case_permutation(s: String) -> Vec<String> {
        let mut ans: Vec<String> = Vec::new();
        let chars: Vec<char> = s.chars().collect();
        fn solve(idx: usize, curr: String, chars: &Vec<char>, ans: &mut Vec<String>) {
            if idx == chars.len() {
                ans.push(curr);
                return;
            }
            if chars[idx].is_digit(10) {
                let mut next = curr.clone();
                next.push(chars[idx]);
                solve(idx + 1, next, chars, ans);
                return;
            }
            let mut lower = curr.clone();
            lower.push(chars[idx].to_lowercase().next().unwrap());
            solve(idx + 1, lower, chars, ans);
            
            let mut upper = curr.clone();
            upper.push(chars[idx].to_uppercase().next().unwrap());
            solve(idx + 1, upper, chars, ans);
        }
        solve(0, String::new(), &chars, &mut ans);
        ans
    }
}
