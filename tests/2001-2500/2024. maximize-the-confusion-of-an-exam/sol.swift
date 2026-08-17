class Solution {
    func maxConsecutiveAnswers(_ answerKey: String, _ k: Int) -> Int {
        let chars = Array(answerKey)
        var l = 0
        var r = 0
        var falseCnt = 0
        var trueCnt = 0
        var result = 0
        let n = chars.count
        while r < n {
            if chars[r] == "T" {
                trueCnt += 1
            }
            if chars[r] == "F" {
                falseCnt += 1
            }
            while trueCnt > k && falseCnt > k {
                if chars[l] == "T" {
                    trueCnt -= 1
                }
                if chars[l] == "F" {
                    falseCnt -= 1
                }
                l += 1
            }
            result = max(result, r - l + 1)
            r += 1
        }
        return result
    }
}
