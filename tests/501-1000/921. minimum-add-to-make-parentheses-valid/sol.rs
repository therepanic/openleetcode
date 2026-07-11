impl Solution {
    pub fn min_add_to_make_valid(s: String) -> i32 {
        let mut l = vec!['0'];
        for i in s.chars() {
            if l[l.len() - 1] == '(' && i == ')' {
                l.pop();
            } else {
                l.push(i);
            }
        }
        (l.len() - 1) as i32
    }
}
