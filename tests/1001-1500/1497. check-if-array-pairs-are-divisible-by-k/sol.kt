class Solution {
    fun canArrange(arr: IntArray, k: Int): Boolean {
        val a = arr.map { ((it % k) + k) % k }.sorted()
        val j = a.count { it == 0 }
        if (j % 2 != 0) return false
        val b = a.drop(j)
        return b.zip(b.reversed()).all { (p, q) -> (p + q) % k == 0 }
    }
}
