class Solution {
    fun checkIfExist(arr: IntArray): Boolean {
        if (arr.count { it == 0 } >= 2) return true

        for (i in arr) {
            if (i != 0 && arr.contains(i * 2)) {
                return true
            }
        }
        return false
    }
}
