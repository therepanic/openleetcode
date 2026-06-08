impl Solution {
    pub fn letter_combinations(digits: String) -> Vec<String> {
        if digits.is_empty() { return vec![]; }
        let map = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"];
        let bytes = digits.as_bytes();
        let mut res = vec![];
        let mut cur = String::new();
        fn backtrack(idx: usize, bytes: &[u8], map: &[&str], cur: &mut String, res: &mut Vec<String>) {
            if idx == bytes.len() {
                res.push(cur.clone());
                return;
            }
            for ch in map[(bytes[idx] - b'0') as usize].chars() {
                cur.push(ch);
                backtrack(idx + 1, bytes, map, cur, res);
                cur.pop();
            }
        }
        backtrack(0, bytes, &map, &mut cur, &mut res);
        res
    }
}
