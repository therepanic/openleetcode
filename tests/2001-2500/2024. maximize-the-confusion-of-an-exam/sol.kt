class Solution {
    fun maxConsecutiveAnswers(answerKey: String, k: Int): Int {
        var l = 0
        var r = 0
        var falseCnt = 0
        var trueCnt = 0
        var result = 0
        val n = answerKey.length
        while (r < n) {
            if (answerKey[r] == 'T') {
                trueCnt++
            }
            if (answerKey[r] == 'F') {
                falseCnt++
            }
            while (trueCnt > k && falseCnt > k) {
                if (answerKey[l] == 'T') {
                    trueCnt--
                }
                if (answerKey[l] == 'F') {
                    falseCnt--
                }
                l++
            }
            result = maxOf(result, r - l + 1)
            r++
        }
        return result
    }
}
