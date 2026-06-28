class Solution {
    fun reorganizeString(s: String): String {
        val charFreq = IntArray(26)
        for (c in s) {
            charFreq[c - 'a']++
        }
        
        val maxHeap = java.util.PriorityQueue<Pair<Int, Char>>(compareByDescending { it.first })
        for (i in 0..25) {
            if (charFreq[i] > 0) {
                maxHeap.offer(Pair(charFreq[i], 'a' + i))
            }
        }
        
        val res = StringBuilder()
        var prevFreq = 0
        var prevChar = ' '
        
        while (maxHeap.isNotEmpty()) {
            val (freq, ch) = maxHeap.poll()
            res.append(ch)
            
            if (prevFreq > 0) {
                maxHeap.offer(Pair(prevFreq, prevChar))
            }
            
            prevFreq = freq - 1
            prevChar = ch
        }
        
        if (res.length != s.length) return ""
        return res.toString()
    }
}
