class Solution {
    func maximumGain(_ s: String, _ x: Int, _ y: Int) -> Int {
        var score = 0
        var ch1: Character = "a"
        var ch2: Character = "b"
        var cnt1 = 0
        var cnt2 = 0
        var xx = x
        var yy = y

        if xx < yy {
            let temp = xx
            xx = yy
            yy = temp
            ch1 = "b"
            ch2 = "a"
        }

        for ch in s {
            if ch == ch1 {
                cnt1 += 1
            } else if ch == ch2 {
                if cnt1 > 0 {
                    cnt1 -= 1
                    score += xx
                } else {
                    cnt2 += 1
                }
            } else {
                score += min(cnt1, cnt2) * yy
                cnt1 = 0
                cnt2 = 0
            }
        }

        if cnt1 != 0 {
            score += min(cnt1, cnt2) * yy
        }

        return score
    }
}
