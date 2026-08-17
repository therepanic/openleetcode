class Solution {
    fun recoverArray(n: Int, sums: IntArray): IntArray {
        sums.sort()
        val res = IntArray(n)
        
        var cur = sums
        for (i in 0 until n) {
            val d = cur[1] - cur[0]
            
            val left = mutableListOf<Int>()
            val right = mutableListOf<Int>()
            val count = mutableMapOf<Int, Int>()
            for (s in cur) count[s] = count.getOrDefault(s, 0) + 1
            
            for (s in cur) {
                if (count[s]!! > 0) {
                    left.add(s)
                    right.add(s + d)
                    count[s] = count[s]!! - 1
                    count[s + d] = count.getOrDefault(s + d, 0) - 1
                }
            }
            
            if (left.contains(0)) {
                res[i] = d
                cur = left.toIntArray()
            } else {
                res[i] = -d
                cur = right.toIntArray()
            }
        }
        return res
    }
}
