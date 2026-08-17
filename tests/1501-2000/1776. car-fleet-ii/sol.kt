class Solution {
    fun getCollisionTimes(cars: Array<IntArray>): DoubleArray {
        val n = cars.size
        val rightGreater = IntArray(n) { -1 }
        val ans = DoubleArray(n) { -1.0 }
        val stack = mutableListOf<Int>()
        for (r in n - 1 downTo 0) {
            while (stack.isNotEmpty() && cars[stack.last()][1] >= cars[r][1]) {
                stack.removeAt(stack.size - 1)
            }
            if (stack.isNotEmpty()) {
                rightGreater[r] = stack.last()
            }
            stack.add(r)
        }
        for (r in n - 1 downTo 0) {
            var collideId = rightGreater[r]
            while (collideId != -1 && ans[collideId] != -1.0 && ans[collideId] < (cars[collideId][0] - cars[r][0]).toDouble() / (cars[r][1] - cars[collideId][1])) {
                collideId = rightGreater[collideId]
            }
            if (collideId != -1) {
                ans[r] = (cars[collideId][0] - cars[r][0]).toDouble() / (cars[r][1] - cars[collideId][1])
            }
        }
        return ans
    }
}
