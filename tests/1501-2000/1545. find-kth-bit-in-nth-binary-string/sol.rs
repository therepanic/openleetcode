impl Solution {
    pub fn find_kth_bit(n: i32, k: i32) -> char {
        if n == 1 {
            return '0';
        }
        
        let length = (1 << n) - 1;
        let mid = (length + 1) / 2;
        
        if k == mid {
            return '1';
        }
        if k < mid {
            return Self::find_kth_bit(n - 1, k);
        }
        
        let c = Self::find_kth_bit(n - 1, length - k + 1);
        if c == '0' { '1' } else { '0' }
    }
}
