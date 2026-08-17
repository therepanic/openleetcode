impl Solution {
    pub fn maximum_time(time: String) -> String {
        let chars: Vec<char> = time.chars().collect();
        let mut ret = String::new();
        for i in 0..chars.len() {
            let c = chars[i];
            if c == '?' {
                if i == 0 {
                    if chars[i+1] == '?' {
                        ret.push('2');
                    } else if chars[i+1] >= '0' && chars[i+1] <= '3' {
                        ret.push('2');
                    } else {
                        ret.push('1');
                    }
                } else if i == 1 {
                    if chars[i-1] == '?' {
                        ret.push('3');
                    } else if chars[i-1] == '0' || chars[i-1] == '1' {
                        ret.push('9');
                    } else {
                        ret.push('3');
                    }
                } else if i == 3 {
                    ret.push('5');
                } else if i == 4 {
                    ret.push('9');
                }
            } else {
                ret.push(c);
            }
        }
        ret
    }
}
