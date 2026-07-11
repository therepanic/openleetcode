impl Solution {
    pub fn gcd_of_strings(str1: String, str2: String) -> String {
        if str1.clone() + &str2 != str2.clone() + &str1 {
            return "".to_string();
        }
        
        fn gcd(len1: usize, len2: usize) -> usize {
            let min_val = std::cmp::min(len1, len2);
            for i in (1..=min_val).rev() {
                if len1 % i == 0 && len2 % i == 0 {
                    return i;
                }
            }
            1
        }
        
        str1[..gcd(str1.len(), str2.len())].to_string()
    }
}
