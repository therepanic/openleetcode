import java.util.PriorityQueue

class Solution {
    fun longestDiverseString(a: Int, b: Int, c: Int): String {
        val maxHeap = PriorityQueue<Pair<Int, Char>>(compareByDescending { it.first })
        val res = StringBuilder()

        if (a > 0) maxHeap.add(a to 'a')
        if (b > 0) maxHeap.add(b to 'b')
        if (c > 0) maxHeap.add(c to 'c')

        while (maxHeap.isNotEmpty()) {
            var (count, ch) = maxHeap.poll()
            val len = res.length
            if (len >= 2 && res[len - 2] == ch && res[len - 1] == ch) {
                if (maxHeap.isEmpty()) {
                    break
                }
                var (count2, ch2) = maxHeap.poll()
                res.append(ch2)
                count2--
                if (count2 > 0) {
                    maxHeap.add(count2 to ch2)
                }
            } else {
                res.append(ch)
                count--
            }

            if (count > 0) {
                maxHeap.add(count to ch)
            }
        }

        return res.toString()
    }
}
