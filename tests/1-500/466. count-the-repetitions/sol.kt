class Solution {
    fun getMaxRepetitions(s1: String, n1: Int, s2: String, n2: Int): Int {
        val m = s1.length
        val n = s2.length
        
        if (m.toLong() * n1 < n.toLong() * n2) {
            return 0
        }
        
        var j = 0
        var cnt = 0
        var k = 0
        
        val seen = mutableMapOf<Int, Pair<Int, Int>>()
        
        while (k < n1) {
            for (ch in s1) {
                if (ch == s2[j]) {
                    j++
                    if (j == n) {
                        cnt++
                        j = 0
                    }
                }
            }
            
            k++
            
            if (seen.containsKey(j)) {
                val (prevCnt, prevK) = seen[j]!!
                val periodK = k - prevK
                val periodCnt = cnt - prevCnt
                
                if (periodCnt == 0) {
                    break
                }
                
                val remaining = n1 - k
                val cycles = remaining / periodK
                
                cnt += cycles * periodCnt
                k += cycles * periodK
            } else {
                seen[j] = Pair(cnt, k)
            }
        }
        
        return cnt / n2
    }
}
