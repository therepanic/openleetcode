impl Solution {
    pub fn full_justify(words: Vec<String>, max_width: i32) -> Vec<String> {
        let mut res = Vec::new();
        let mut i = 0usize;
        let n = words.len();
        let max_width = max_width as usize;

        while i < n {
            let mut j = i;
            let mut line_len = 0usize;
            while j < n && line_len + words[j].len() + (j - i) <= max_width {
                line_len += words[j].len();
                j += 1;
            }

            let spaces = max_width - line_len;
            let gaps = j - i - 1;
            let mut line = String::new();

            if j == n || gaps == 0 {
                for k in i..j {
                    if k > i {
                        line.push(' ');
                    }
                    line.push_str(&words[k]);
                }
                line.push_str(&" ".repeat(max_width - line.len()));
            } else {
                let each = spaces / gaps;
                let mut extra = spaces % gaps;
                for k in i..j {
                    line.push_str(&words[k]);
                    if k + 1 < j {
                        let count = each + if extra > 0 { 1 } else { 0 };
                        line.push_str(&" ".repeat(count));
                        if extra > 0 {
                            extra -= 1;
                        }
                    }
                }
            }

            res.push(line);
            i = j;
        }

        res
    }
}
