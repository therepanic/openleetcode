class Solution {
    fun carFleet(target: Int, position: IntArray, speed: IntArray): Int {
        val cars = position.zip(speed).sortedByDescending { it.first }
        val stack = mutableListOf<Double>()
        for ((p, s) in cars) {
            val t = (target - p).toDouble() / s
            if (stack.isEmpty() || t > stack.last()) {
                stack.add(t)
            }
        }
        return stack.size
    }
}
