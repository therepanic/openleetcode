import java.util.*

class Solution {
    fun canMeasureWater(x: Int, y: Int, target: Int): Boolean {
        if (target > x + y) return false
        val stack = ArrayDeque<IntArray>()
        val visited = HashSet<String>()
        stack.push(intArrayOf(0, 0))
        while (!stack.isEmpty()) {
            val (a, b) = stack.pop()
            if (a + b == target) return true
            val key = "$a,$b"
            if (key in visited) continue
            visited.add(key)
            stack.push(intArrayOf(x, b))
            stack.push(intArrayOf(a, y))
            stack.push(intArrayOf(0, b))
            stack.push(intArrayOf(a, 0))
            var w = minOf(a, y - b)
            stack.push(intArrayOf(a - w, b + w))
            w = minOf(b, x - a)
            stack.push(intArrayOf(a + w, b - w))
        }
        return false
    }
}
