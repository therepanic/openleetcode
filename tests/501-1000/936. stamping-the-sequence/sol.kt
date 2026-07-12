class Solution {
    fun movesToStamp(stamp: String, target: String): IntArray {
        val m = stamp.length
        val n = target.length
        val stampArr = stamp.toCharArray()
        val targetArr = target.toCharArray()
        
        fun canStamp(i: Int): Boolean {
            for (j in 0 until m) {
                if (targetArr[i + j] != '?' && targetArr[i + j] != stampArr[j]) {
                    return false
                }
            }
            return true
        }
        
        fun applyStamp(i: Int) {
            for (j in 0 until m) {
                targetArr[i + j] = '?'
            }
        }
        
        val stamped = BooleanArray(n)
        val result = mutableListOf<Int>()
        val queue = ArrayDeque<Int>()
        
        for (i in 0..n - m) {
            if (canStamp(i)) {
                applyStamp(i)
                queue.addLast(i)
                result.add(i)
                stamped[i] = true
            }
        }
        
        while (queue.isNotEmpty()) {
            val pos = queue.removeFirst()
            val start = maxOf(0, pos - m + 1)
            val end = minOf(n - m, pos + m)
            for (i in start..end) {
                if (canStamp(i)) {
                    if (!stamped[i]) {
                        applyStamp(i)
                        queue.addLast(i)
                        result.add(i)
                        stamped[i] = true
                    }
                }
            }
        }
        
        if (targetArr.all { it == '?' }) {
            return result.reversed().toIntArray()
        }
        return intArrayOf()
    }
}
