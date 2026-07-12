class Solution {
    fun binaryGap(n: Int): Int {
        var maxDist = 0
        var currDist = 0
        var foundFirstOne = false
        var num = n
        
        while (num > 0) {
            val bit = num % 2
            
            if (bit == 1) {
                if (foundFirstOne) {
                    maxDist = maxOf(maxDist, currDist)
                }
                
                currDist = 1
                foundFirstOne = true
            } else {
                if (foundFirstOne) {
                    currDist++
                }
            }
            
            num /= 2
        }
        
        return maxDist
    }
}
