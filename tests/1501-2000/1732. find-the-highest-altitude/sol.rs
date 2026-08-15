impl Solution {
    pub fn largest_altitude(gain: Vec<i32>) -> i32 {
        let mut ans = 0i32;
        let mut acc = 0i32;
        for it in gain {
            acc += it;
            let d = acc - ans;
            ans += d & !(d >> 31);
        }
        ans
    }
}
