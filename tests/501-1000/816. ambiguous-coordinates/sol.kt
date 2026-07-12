class Solution {
    fun ambiguousCoordinates(s: String): List<String> {
        val str = s.substring(1, s.length - 1)
        val finalResults = mutableListOf<String>()
        
        for (i in 1 until str.length) {
            val xOptions = getValidNumbers(str.substring(0, i))
            val yOptions = getValidNumbers(str.substring(i))
            
            for (x in xOptions) {
                for (y in yOptions) {
                    finalResults.add("($x, $y)")
                }
            }
        }
        
        return finalResults
    }
    
    private fun getValidNumbers(numStr: String): List<String> {
        val res = mutableListOf<String>()
        
        for (i in 1..numStr.length) {
            val left = numStr.substring(0, i)
            val right = numStr.substring(i)
            
            if ((left.length > 1 && left.startsWith("0")) || right.endsWith("0")) {
                continue
            }
            
            if (right.isEmpty()) {
                res.add(left)
            } else {
                res.add("$left.$right")
            }
        }
        
        return res
    }
}
