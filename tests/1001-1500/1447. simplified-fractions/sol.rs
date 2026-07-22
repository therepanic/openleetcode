impl Solution {
    pub fn simplified_fractions(n: i32) -> Vec<String> {
        let mut fractions = Vec::new();
        for numerator in 1..n {
            for denominator in (numerator + 1)..=n {
                if Self::gcd(numerator, denominator) == 1 {
                    fractions.push(format!("{}/{}", numerator, denominator));
                }
            }
        }
        fractions
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
