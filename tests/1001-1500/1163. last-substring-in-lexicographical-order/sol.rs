impl Solution {
    pub fn last_substring(s: String) -> String {
        let bytes = s.as_bytes();
        let n = bytes.len();
        let (mut i, mut j, mut k) = (0, 1, 0);
        while j + k < n {
            if bytes[i + k] == bytes[j + k] {
                k += 1;
                continue;
            } else if bytes[i + k] > bytes[j + k] {
                j = j + k + 1;
            } else {
                i = std::cmp::max(i + k + 1, j);
                j = i + 1;
            }
            k = 0;
        }
        s[i..].to_string()
    }
}
