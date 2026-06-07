impl Solution {
    pub fn longest_common_prefix(mut strs: Vec<String>) -> String {
        if strs.is_empty() { return String::new(); }
        strs.sort();
        let a = strs.first().unwrap().as_bytes();
        let b = strs.last().unwrap().as_bytes();
        let mut i = 0;
        while i < a.len() && i < b.len() && a[i] == b[i] {
            i += 1;
        }
        strs[0][..i].to_string()
    }
}
