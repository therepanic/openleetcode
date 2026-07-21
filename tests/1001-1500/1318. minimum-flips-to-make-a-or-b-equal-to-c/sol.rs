impl Solution {
    pub fn min_flips(a: i32, b: i32, c: i32) -> i32 {
        let mut count = 0;
        let mut aa = a;
        let mut bb = b;
        let mut cc = c;
        while aa != 0 || bb != 0 || cc != 0 {
            let abit = aa & 1;
            let bbit = bb & 1;
            let cbit = cc & 1;

            if cbit == 0 {
                if abit == 1 { count += 1; }
                if bbit == 1 { count += 1; }
            } else {
                if abit == 0 && bbit == 0 { count += 1; }
            }

            aa >>= 1;
            bb >>= 1;
            cc >>= 1;
        }
        count
    }
}
