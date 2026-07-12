impl Solution {
    pub fn min_flips_mono_incr(s: String) -> i32 {
        let mut zeroes = 0;
        let mut ones = 0;
        
        for ch in s.chars() {
            if ch == '0' {
                zeroes += 1;
            }
        }
        
        let mut output = zeroes;
        
        for ch in s.chars() {
            if ch == '0' {
                zeroes -= 1;
            } else if ch == '1' {
                ones += 1;
            }
            output = output.min(zeroes + ones);
        }
        
        output
    }
}
