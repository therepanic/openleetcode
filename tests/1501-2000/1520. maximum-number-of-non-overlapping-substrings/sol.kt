class Solution {
    fun maxNumOfSubstrings(s: String): List<String> {
        val n = s.length
        val counts = mutableMapOf<Char, Int>()
        for (c in s) {
            counts[c] = counts.getOrDefault(c, 0) + 1
        }
        val first = mutableMapOf<Char, Int>()
        val last = mutableMapOf<Char, Int>()
        for (k in counts.keys) {
            first[k] = s.indexOf(k)
            last[k] = s.lastIndexOf(k)
        }
        
        val res = mutableListOf<String>()
        val queue = ArrayDeque<IntArray>()
        
        for (k in counts.keys) {
            queue.addFirst(intArrayOf(first[k]!!, last[k]!!, counts[k]!!))
            var left = Int.MAX_VALUE
            var right = Int.MIN_VALUE
            var total = 0
            
            for (arr in queue) {
                total += arr[2]
                left = minOf(left, arr[0])
                right = maxOf(right, arr[1])
                if (total == right - left + 1) {
                    break
                }
            }
            
            if (total == right - left + 1) {
                res.add(s.substring(left, right + 1))
                queue.clear()
            }
        }
        
        return res
    }
}
