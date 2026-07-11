impl Solution {
    pub fn defang_i_paddr(address: String) -> String {
        let mut s = String::new();
        for i in address.chars() {
            if i == '.' {
                s.push_str("[.]");
            } else {
                s.push(i);
            }
        }
        s
    }
}
