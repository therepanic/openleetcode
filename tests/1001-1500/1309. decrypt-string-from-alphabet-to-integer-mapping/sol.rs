impl Solution {
    pub fn freq_alphabets(s: String) -> String {
        let mut decoded = Vec::new();
        let bytes = s.as_bytes();
        let mut index = 0;
        while index < bytes.len() {
            if index + 2 < bytes.len() && bytes[index + 2] == b'#' {
                let num = (bytes[index] - b'0') * 10 + (bytes[index + 1] - b'0');
                decoded.push(b'a' + num - 1);
                index += 3;
            } else {
                let num = bytes[index] - b'0';
                decoded.push(b'a' + num - 1);
                index += 1;
            }
        }
        String::from_utf8(decoded).unwrap()
    }
}
