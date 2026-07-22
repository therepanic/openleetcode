impl Solution {
    pub fn min_number_of_frogs(croak_of_frogs: String) -> i32 {
        let mut maxi = 0;
        let mut curr = 0;
        let mut c = 0;
        let mut r = 0;
        let mut o = 0;
        let mut a = 0;
        let mut k = 0;
        for ch in croak_of_frogs.chars() {
            if ch == 'c' {
                c += 1;
                curr += 1;
            } else if ch == 'r' {
                r += 1;
            } else if ch == 'o' {
                o += 1;
            } else if ch == 'a' {
                a += 1;
            } else if ch == 'k' {
                k += 1;
                curr -= 1;
            }
            maxi = maxi.max(curr);
            if c < r || r < o || o < a || a < k {
                return -1;
            }
        }
        if curr == 0 && c == r && r == o && o == a && a == k {
            return maxi;
        } else {
            return -1;
        }
    }
}
