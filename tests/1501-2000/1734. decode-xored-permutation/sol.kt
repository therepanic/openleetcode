class Solution {
    fun decode(encoded: IntArray): IntArray {
        val n = encoded.size + 1
        var xr = 0
        for (i in 1..n) xr = xr xor i
        var nxr = 0
        for (i in encoded.indices) {
            if (i % 2 == 1) nxr = nxr xor encoded[i]
        }
        val perm = IntArray(n)
        perm[0] = xr xor nxr
        for (i in encoded.indices) {
            perm[i + 1] = encoded[i] xor perm[i]
        }
        return perm
    }
}
