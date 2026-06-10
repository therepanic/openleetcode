class Solution {
    fun isHappy(n: Int): Boolean {
        val seen = HashSet<Int>()
        var current = n
        while (current != 1 && seen.add(current)) {
            current = nextValue(current)
        }
        return current == 1
    }

    private fun nextValue(n: Int): Int {
        var current = n
        var total = 0
        while (current > 0) {
            val digit = current % 10
            total += digit * digit
            current /= 10
        }
        return total
    }
}
