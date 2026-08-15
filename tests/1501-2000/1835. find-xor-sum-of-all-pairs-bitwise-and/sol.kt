class Solution {
    fun getXORSum(arr1: IntArray, arr2: IntArray): Int {
        var x = 0
        var y = 0
        for (v in arr1) {
            x = x xor v
        }
        for (v in arr2) {
            y = y xor v
        }
        return x and y
    }
}
