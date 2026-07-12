class Solution {
    fun bagOfTokensScore(tokens: IntArray, power: Int): Int {
        tokens.sort()
        val n = tokens.size
        var l = 0
        var curr = 0
        var p = power
        
        while (l < n && tokens[l] <= p) {
            p -= tokens[l]
            l++
            curr++
        }
        
        var r = n - 1
        var res = curr
        
        while (l < r && curr > 0) {
            p += tokens[r]
            curr--
            r--
            
            while (l <= r && tokens[l] <= p) {
                p -= tokens[l]
                l++
                curr++
            }
            res = maxOf(res, curr)
        }
        
        return res
    }
}
