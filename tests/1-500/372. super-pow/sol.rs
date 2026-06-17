impl Solution {
    pub fn super_pow(a: i32, b: Vec<i32>) -> i32 {
        let a = a % 1337;
        let mut result = 1;
        for d in b {
            result = (Self::pow_mod(result, 10, 1337) * Self::pow_mod(a, d, 1337)) % 1337;
        }
        result
    }
    
    fn pow_mod(x: i32, n: i32, m: i32) -> i32 {
        let mut base = x % m;
        let mut exp = n;
        let mut res = 1;
        while exp > 0 {
            if exp & 1 == 1 {
                res = (res * base) % m;
            }
            base = (base * base) % m;
            exp >>= 1;
        }
        res
    }
}
