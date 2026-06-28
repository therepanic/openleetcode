class Solution {
    fun predictPartyVictory(senate: String): String {
        val r = java.util.ArrayDeque<Int>()
        val d = java.util.ArrayDeque<Int>()
        val n = senate.length
        
        for (i in 0 until n) {
            if (senate[i] == 'R') {
                r.addLast(i)
            } else {
                d.addLast(i)
            }
        }
        
        while (r.isNotEmpty() && d.isNotEmpty()) {
            val rIdx = r.removeFirst()
            val dIdx = d.removeFirst()
            
            if (rIdx < dIdx) {
                r.addLast(rIdx + n)
            } else {
                d.addLast(dIdx + n)
            }
        }
        
        return if (r.isEmpty()) "Dire" else "Radiant"
    }
}
