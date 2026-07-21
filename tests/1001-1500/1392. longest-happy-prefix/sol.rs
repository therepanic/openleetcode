impl Solution {
    pub fn longest_prefix(s: String) -> String {
        let n = s.len();
        let chars: Vec<char> = s.chars().collect();
        let mut prefix = vec![0; n];
        let mut matched = 0;
        for i in 1..n {
            while matched > 0 && chars[i] != chars[matched] {
                matched = prefix[matched - 1];
            }
            if chars[i] == chars[matched] {
                matched += 1;
            }
            prefix[i] = matched;
        }
        chars[0..prefix[n - 1]].iter().collect()
    }
}
