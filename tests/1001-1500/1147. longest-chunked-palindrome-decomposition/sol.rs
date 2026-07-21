impl Solution {
    pub fn longest_decomposition(text: String) -> i32 {
        let bytes = text.as_bytes();
        let mut i = 0;
        let mut j = text.len() as i32 - 1;
        let mut n = 0;
        let mut count = 0;
        while i <= j {
            if bytes[i as usize] == bytes[j as usize] {
                if text[i as usize..i as usize + n as usize + 1] == text[j as usize..j as usize + n as usize + 1] {
                    count += 2;
                    i += n + 1;
                    j -= 1;
                    n = 0;
                    continue;
                }
            }
            j -= 1;
            n += 1;
        }
        if i == j + 1 { count } else { count - 1 }
    }
}
