impl Solution {
    pub fn tribonacci(n: i32) -> i32 {
        let mut ft = 0;
        let mut st = 1;
        let mut tt = 1;
        for _ in 1..=n {
            let frt = ft + st + tt;
            ft = st;
            st = tt;
            tt = frt;
        }
        ft
    }
}
