class Solution {
    fun canFormArray(arr: IntArray, pieces: Array<IntArray>): Boolean {
        val a = mutableListOf<Int>()
        val p = pieces.toMutableList()
        for (i in arr) {
            for (j in p.indices) {
                if (p[j].contains(i)) {
                    a.addAll(p[j].toList())
                    p.removeAt(j)
                    break
                }
            }
        }
        return a == arr.toList()
    }
}
