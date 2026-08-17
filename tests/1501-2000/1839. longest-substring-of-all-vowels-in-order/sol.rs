impl Solution {
    pub fn longest_beautiful_substring(word: String) -> i32 {
        let chars: Vec<char> = word.chars().collect();
        let n = chars.len();
        let mut i = 0;
        let mut length = 0;

        while i < n {
            if chars[i] != 'a' {
                i += 1;
                continue;
            }

            let mut j = i;
            let mut unique = 1;
            while j + 1 < n && chars[j + 1] >= chars[j] {
                if chars[j + 1] != chars[j] {
                    unique += 1;
                }
                j += 1;
            }

            if unique == 5 {
                length = length.max((j - i + 1) as i32);
            }

            i = j + 1;
        }

        length
    }
}
