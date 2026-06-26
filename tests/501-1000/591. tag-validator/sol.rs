impl Solution {
    pub fn is_valid(code: String) -> bool {
        use regex::Regex;
        let tag_pat = Regex::new(r"^<(/?)([A-Z]{1,9})>$").unwrap();
        let open_cdata = "<![CDATA[";
        let close_cdata = "]]>";
        let mut stack: Vec<String> = Vec::new();
        let mut first_tag_seen = false;
        let mut i = 0;
        let j = code.len();
        
        while i <= j {
            if let Some(s) = code[i..].find('<') {
                let s = i + s;
                if let Some(e) = code[s+1..].find('>') {
                    let e = s + 1 + e;
                    
                    let candidate = &code[s..=e];
                    if let Some(caps) = tag_pat.captures(candidate) {
                        let tag = caps.get(2).unwrap().as_str();
                        let slash = caps.get(1).unwrap().as_str();
                        
                        if slash.is_empty() {
                            if !first_tag_seen && s != 0 {
                                return false;
                            }
                            stack.push(tag.to_string());
                            first_tag_seen = true;
                        } else {
                            if stack.is_empty() || stack.last().unwrap() != tag {
                                return false;
                            }
                            if stack.len() == 1 && e != code.len() - 1 {
                                return false;
                            }
                            stack.pop();
                        }
                        
                        i = e + 1;
                    } else if code[s..].starts_with(open_cdata) {
                        if let Some(k) = code[s + open_cdata.len()..].find(close_cdata) {
                            i = s + open_cdata.len() + k + close_cdata.len();
                        } else {
                            return false;
                        }
                    } else {
                        return false;
                    }
                } else {
                    return false;
                }
            } else {
                break;
            }
        }
        
        stack.is_empty() && first_tag_seen
    }
}
