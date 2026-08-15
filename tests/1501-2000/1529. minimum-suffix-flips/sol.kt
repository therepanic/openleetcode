class Solution {
    fun minFlips(target: String): Int {
        var minCount = 0
        var flag = 0
        val n = target.length
        
        for (i in 0 until n) {
            if (target[i] != ('0' + (flag % 2))) {
                minCount++
                flag++
            }
        }
        
        return minCount
    }
}
