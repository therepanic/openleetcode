class Solution {
    fun strWithout3a3b(a: Int, b: Int): String {
        val res = StringBuilder()
        var aCount = a
        var bCount = b
        var prevA = 0
        var prevB = 0
        
        while (aCount > 0 || bCount > 0) {
            when {
                prevA == 2 && bCount > 0 -> {
                    res.append("b")
                    bCount--
                    prevB++
                    prevA = 0
                }
                prevB == 2 && aCount > 0 -> {
                    res.append("a")
                    aCount--
                    prevA++
                    prevB = 0
                }
                aCount > bCount && aCount > 0 -> {
                    res.append("a")
                    aCount--
                    prevA++
                }
                bCount > 0 -> {
                    res.append("b")
                    bCount--
                    prevB++
                }
            }
        }
        return res.toString()
    }
}
