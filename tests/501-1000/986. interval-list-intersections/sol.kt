class Solution {
    fun intervalIntersection(firstList: Array<IntArray>, secondList: Array<IntArray>): Array<IntArray> {
        if (firstList.isEmpty() || secondList.isEmpty()) {
            return emptyArray()
        }
        
        val n = firstList.size
        val m = secondList.size
        val res = mutableListOf<IntArray>()
        var i = 0
        var j = 0
        
        while (i < n && j < m) {
            val s1 = firstList[i][0]
            val e1 = firstList[i][1]
            val s2 = secondList[j][0]
            val e2 = secondList[j][1]
            
            if (e1 >= s2 && s1 <= e2) {
                res.add(intArrayOf(maxOf(s1, s2), minOf(e1, e2)))
            }
            
            if (e1 > e2) {
                j++
            } else {
                i++
            }
        }
        
        return res.toTypedArray()
    }
}
