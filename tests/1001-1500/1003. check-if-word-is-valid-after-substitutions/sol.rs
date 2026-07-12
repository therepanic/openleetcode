impl Solution {
    pub fn is_valid(s: String) -> bool {
        if s == "abc" {
            return true;
        }
        let chars: Vec<char> = s.chars().collect();
        if chars[0] != 'a' || chars[chars.len() - 1] != 'c' {
            return false;
        }
        let mut l = s.chars().collect::<Vec<char>>();
        for _j in 0..l.len() {
            let mut i = 0;
            while i as i32 <= l.len() as i32 - 3 {
                if l == vec!['a', 'b', 'c'] {
                    return true;
                }
                if i + 2 <= l.len() - 1 {
                    if l[i] == 'a' && l[i+1] == 'b' && l[i+2] == 'c' {
                        l.remove(i);
                        l.remove(i);
                        l.remove(i);
                        i = 0;
                        continue;
                    }
                }
                i += 1;
            }
        }
        if l.len() == 0 {
            return true;
        }
        false
    }
}
