class Solution {
    fun decode(encoded: IntArray, first: Int): IntArray {
        val arr = IntArray(encoded.size + 1)
        arr[0] = first
        for (i in encoded.indices) {
            arr[i+1] = arr[i] xor encoded[i]
        }
        return arr
    }
}
