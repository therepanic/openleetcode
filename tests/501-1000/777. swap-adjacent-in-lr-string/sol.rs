impl Solution {
    pub fn can_transform(start: String, result: String) -> bool {
        let n = start.len();
        let start_bytes = start.as_bytes();
        let result_bytes = result.as_bytes();
        let mut i = 0;
        let mut j = 0;

        while i < n || j < n {
            while i < n && start_bytes[i] == b'X' {
                i += 1;
            }
            while j < n && result_bytes[j] == b'X' {
                j += 1;
            }

            if (i == n) != (j == n) {
                return false;
            }

            if i < n && j < n {
                if start_bytes[i] != result_bytes[j] {
                    return false;
                }
                if start_bytes[i] == b'L' && j > i {
                    return false;
                }
                if start_bytes[i] == b'R' && j < i {
                    return false;
                }
            }

            if i < n {
                i += 1;
            }
            if j < n {
                j += 1;
            }
        }

        true
    }
}
