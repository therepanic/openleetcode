class Solution {
    fun canReach(arr: IntArray, start: Int): Boolean {
        val seen = mutableSetOf<Int>()
        val queue = ArrayDeque<Int>()
        queue.add(start)
        while (queue.isNotEmpty()) {
            val index = queue.removeFirst()
            if (index < 0 || index >= arr.size || index in seen) {
                continue
            }
            if (arr[index] == 0) {
                return true
            }
            seen.add(index)
            queue.add(index + arr[index])
            queue.add(index - arr[index])
        }
        return false
    }
}
