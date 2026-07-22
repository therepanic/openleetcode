impl Solution {
    pub fn is_good_array(nums: Vec<i32>) -> bool {
        let mut g = nums[0];
        for &num in &nums[1..] {
            g = gcd(g, num);
        }
        g == 1
    }
}

fn gcd(mut a: i32, mut b: i32) -> i32 {
    while b != 0 {
        let t = b;
        b = a % b;
        a = t;
    }
    a
}
