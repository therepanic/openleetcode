impl Solution {
    pub fn mask_pii(s: String) -> String {
        if s.contains('@') {
            let parts: Vec<&str> = s.split('@').collect();
            let name = parts[0].to_lowercase();
            let domain = parts[1].to_lowercase();
            let masked_name = format!("{}*****{}", &name[0..1], &name[name.len()-1..]);
            return format!("{}@{}", masked_name, domain);
        } else {
            let mut gg = String::new();
            for x in s.chars() {
                if x.is_digit(10) {
                    gg.push(x);
                }
            }
            let l = gg.len();
            if l > 10 {
                return format!("+{}-***-***-{}", "*".repeat(l - 10), &gg[l-4..]);
            }
            return format!("***-***-{}", &gg[l-4..]);
        }
    }
}
