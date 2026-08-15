impl Solution {
    pub fn maximum_gain(s: String, x: i32, y: i32) -> i32 {
        let mut score = 0;
        let mut ch1 = 'a';
        let mut ch2 = 'b';
        let mut cnt1 = 0;
        let mut cnt2 = 0;
        let mut xx = x;
        let mut yy = y;

        if xx < yy {
            let temp = xx;
            xx = yy;
            yy = temp;
            ch1 = 'b';
            ch2 = 'a';
        }

        for ch in s.chars() {
            if ch == ch1 {
                cnt1 += 1;
            } else if ch == ch2 {
                if cnt1 > 0 {
                    cnt1 -= 1;
                    score += xx;
                } else {
                    cnt2 += 1;
                }
            } else {
                score += cnt1.min(cnt2) * yy;
                cnt1 = 0;
                cnt2 = 0;
            }
        }

        if cnt1 != 0 {
            score += cnt1.min(cnt2) * yy;
        }

        return score;
    }
}
