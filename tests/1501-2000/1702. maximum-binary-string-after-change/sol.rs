impl Solution {
    pub fn maximum_binary_string(binary: String) -> String {
        let n = binary.len();
        let z = binary.chars().filter(|&c| c == '0').count();
        
        if z < 2 {
            return binary;
        }
        
        let first_zero = binary.find('0').unwrap();
        let p = first_zero + z - 1;
        
        "1".repeat(p) + "0" + &"1".repeat(n - p - 1)
    }
}
