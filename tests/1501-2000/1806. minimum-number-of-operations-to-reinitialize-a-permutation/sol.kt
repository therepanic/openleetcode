class Solution {
    fun reinitializePermutation(n: Int): Int {
        val original = IntArray(n) { it }
        var permut = original.copyOf()
        val arr = IntArray(n)
        var count = 0
        while (true) {
            for (i in 0 until n) {
                if (i % 2 == 0) {
                    arr[i] = permut[i / 2]
                } else {
                    arr[i] = permut[n / 2 + (i - 1) / 2]
                }
            }
            permut = arr.copyOf()
            count++
            if (permut.contentEquals(original)) break
        }
        return count
    }
}
