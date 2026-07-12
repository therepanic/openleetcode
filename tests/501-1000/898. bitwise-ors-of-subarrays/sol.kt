class Solution {
    fun subarrayBitwiseORs(arr: IntArray): Int {
        val resultOrs = mutableSetOf<Int>()
        var currentOrs = mutableSetOf<Int>()
        
        for (x in arr) {
            val nextOrs = mutableSetOf<Int>()
            for (y in currentOrs) {
                nextOrs.add(x or y)
            }
            nextOrs.add(x)
            resultOrs.addAll(nextOrs)
            currentOrs = nextOrs
        }
        
        return resultOrs.size
    }
}
