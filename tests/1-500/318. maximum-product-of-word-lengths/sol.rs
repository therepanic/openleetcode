impl Solution {
    pub fn max_product(words: Vec<String>) -> i32 {
        let n = words.len();
        let mut bitmasks = vec![0i32; n];
        for i in 0..n {
            let mut mask = 0i32;
            for c in words[i].chars() {
                mask |= 1 << (c as u8 - b'a');
            }
            bitmasks[i] = mask;
        }
        let mut max_prod = 0i32;
        for i in 0..n {
            for j in (i+1)..n {
                if bitmasks[i] & bitmasks[j] == 0 {
                    let prod = (words[i].len() as i32) * (words[j].len() as i32);
                    if prod > max_prod {
                        max_prod = prod;
                    }
                }
            }
        }
        max_prod
    }
}
