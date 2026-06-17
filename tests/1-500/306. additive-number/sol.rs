impl Solution {
    pub fn is_additive_number(num: String) -> bool {
        fn add_strings(a: &str, b: &str) -> String {
            let mut i = a.len() as i32 - 1;
            let mut j = b.len() as i32 - 1;
            let mut carry = 0;
            let mut out = Vec::new();
            let ab = a.as_bytes();
            let bb = b.as_bytes();
            while i >= 0 || j >= 0 || carry != 0 {
                let mut sum = carry;
                if i >= 0 {
                    sum += (ab[i as usize] - b'0') as i32;
                    i -= 1;
                }
                if j >= 0 {
                    sum += (bb[j as usize] - b'0') as i32;
                    j -= 1;
                }
                out.push((b'0' + (sum % 10) as u8) as char);
                carry = sum / 10;
            }
            out.iter().rev().collect()
        }

        let n = num.len();
        for i in 1..n {
            if num.as_bytes()[0] == b'0' && i > 1 {
                break;
            }
            for j in i + 1..n {
                if num.as_bytes()[i] == b'0' && j > i + 1 {
                    break;
                }
                let mut a = num[..i].to_string();
                let mut b = num[i..j].to_string();
                let mut k = j;
                let mut used = 2;
                while k < n {
                    let c = add_strings(&a, &b);
                    if k + c.len() > n || !num[k..].starts_with(&c) {
                        break;
                    }
                    k += c.len();
                    a = b;
                    b = c;
                    used += 1;
                }
                if k == n && used >= 3 {
                    return true;
                }
            }
        }
        false
    }
}
