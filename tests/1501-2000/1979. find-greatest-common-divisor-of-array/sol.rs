impl Solution {
    pub fn find_gcd(nums: Vec<i32>) -> i32 {
        let a = *nums.iter().min().unwrap();
        let b = *nums.iter().max().unwrap();
        Self::gcd(a, b)
    }
    
    fn gcd(mut a: i32, mut b: i32) -> i32 {
        while b != 0 {
            let temp = b;
            b = a % b;
            a = temp;
        }
        a
    }
}
