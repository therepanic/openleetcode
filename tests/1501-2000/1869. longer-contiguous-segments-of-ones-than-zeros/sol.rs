impl Solution {
    pub fn check_zero_ones(s: String) -> bool {
        let mut max1 = 0;
        let mut max0 = 0;
        let mut one = 0;
        let mut zero = 0;
        
        for ch in s.chars() {
            if ch == '1' {
                one += 1;
                zero = 0;
                max1 = max1.max(one);
            } else {
                zero += 1;
                one = 0;
                max0 = max0.max(zero);
            }
        }
        
        max1 > max0
    }
}
