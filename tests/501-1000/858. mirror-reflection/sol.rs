impl Solution {
    pub fn mirror_reflection(p: i32, q: i32) -> i32 {
        let mut pp = p;
        let mut qq = q;
        while pp % 2 == 0 && qq % 2 == 0 {
            pp /= 2;
            qq /= 2;
        }
        if pp % 2 == 0 {
            2
        } else if qq % 2 == 0 {
            0
        } else {
            1
        }
    }
}
