impl Solution {
    pub fn reverse_parentheses(s: String) -> String {
        let chars: Vec<char> = s.chars().collect();
        let mut i: usize = 0;
        Self::helper(&chars, &mut i)
    }

    fn helper(s: &Vec<char>, i: &mut usize) -> String {
        let mut ans = String::new();
        while *i < s.len() {
            if s[*i] == '(' {
                *i += 1;
                ans.push_str(&Self::helper(s, i));
            } else if s[*i] == ')' {
                *i += 1;
                return ans.chars().rev().collect();
            } else {
                ans.push(s[*i]);
                *i += 1;
            }
        }
        ans
    }
}
