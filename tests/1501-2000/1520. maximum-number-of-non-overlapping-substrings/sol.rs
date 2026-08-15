impl Solution {
    pub fn max_num_of_substrings(s: String) -> Vec<String> {
        let bytes = s.as_bytes();
        let n = bytes.len();
        let mut first = [n; 26];
        let mut last = [0; 26];
        for (index, &ch) in bytes.iter().enumerate() {
            let letter = (ch - b'a') as usize;
            first[letter] = first[letter].min(index);
            last[letter] = index;
        }

        let mut answer = Vec::new();
        let mut previous_end: isize = -1;
        for start in 0..n {
            if first[(bytes[start] - b'a') as usize] != start {
                continue;
            }
            let mut end = last[(bytes[start] - b'a') as usize];
            let mut index = start;
            let mut valid = true;
            while index <= end {
                let letter = (bytes[index] - b'a') as usize;
                if first[letter] < start {
                    valid = false;
                    break;
                }
                end = end.max(last[letter]);
                index += 1;
            }
            if !valid {
                continue;
            }
            let value = s[start..end + 1].to_string();
            if start as isize > previous_end {
                answer.push(value);
            } else {
                answer.pop();
                answer.push(value);
            }
            previous_end = end as isize;
        }
        answer
    }
}
