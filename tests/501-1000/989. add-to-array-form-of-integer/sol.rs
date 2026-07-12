impl Solution {
    pub fn add_to_array_form(num: Vec<i32>, k: i32) -> Vec<i32> {
        let mut out = Vec::new();
        let mut i = num.len() as i32 - 1;
        let mut carry = k;
        while i >= 0 || carry > 0 {
            if i >= 0 {
                carry += num[i as usize];
                i -= 1;
            }
            out.push(carry % 10);
            carry /= 10;
        }
        if out.is_empty() {
            return vec![0];
        }
        out.reverse();
        out
    }
}
