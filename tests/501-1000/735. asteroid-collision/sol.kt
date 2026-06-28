class Solution {
    fun asteroidCollision(asteroids: IntArray): IntArray {
        val res = mutableListOf<Int>()
        for (a in asteroids) {
            var destroyed = false
            while (res.isNotEmpty() && a < 0 && res.last() > 0) {
                if (-a > res.last()) {
                    res.removeAt(res.lastIndex)
                    continue
                } else if (-a == res.last()) {
                    res.removeAt(res.lastIndex)
                }
                destroyed = true
                break
            }
            if (!destroyed) {
                res.add(a)
            }
        }
        return res.toIntArray()
    }
}
