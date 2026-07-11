impl Solution {
    pub fn str_without3a3b(a: i32, b: i32) -> String {
        let mut res = String::new();
        let mut a_count = a;
        let mut b_count = b;
        let mut prev_a = 0;
        let mut prev_b = 0;
        
        while a_count > 0 || b_count > 0 {
            if prev_a == 2 && b_count > 0 {
                res.push('b');
                b_count -= 1;
                prev_b += 1;
                prev_a = 0;
            } else if prev_b == 2 && a_count > 0 {
                res.push('a');
                a_count -= 1;
                prev_a += 1;
                prev_b = 0;
            } else if a_count > b_count && a_count > 0 {
                res.push('a');
                a_count -= 1;
                prev_a += 1;
            } else if b_count > 0 {
                res.push('b');
                b_count -= 1;
                prev_b += 1;
            }
        }
        res
    }
}
