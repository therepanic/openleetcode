class Solution {
    fun selfDividingNumbers(left: Int, right: Int): List<Int> {
        val lst = mutableListOf<Int>()
        for (i in left..right) {
            val temp = i.toString().map { it - '0' }
            if (0 in temp) continue
            var b = 1
            for (j in temp) {
                if (i % j != 0) {
                    b = 0
                    break
                }
            }
            if (b == 1) lst.add(i)
        }
        return lst
    }
}
