impl Solution {
    pub fn min_flips(target: String) -> i32 {
        let mut min_count = 0;
        let mut flag = 0;
        let n = target.len();
        let chars: Vec<char> = target.chars().collect();
        
        for i in 0..n {
            let expected = char::from_u32(48 + (flag % 2) as u32).unwrap();
            if chars[i] != expected {
                min_count += 1;
                flag += 1;
            }
        }
        
        min_count
    }
}
