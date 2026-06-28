class Solution {
    fun maximumSwap(num: Int): Int {
        val numList = num.toString().toCharArray()
        val lastIndex = IntArray(10)
        for (i in numList.indices) {
            lastIndex[numList[i] - '0'] = i
        }
        for (i in numList.indices) {
            val d = numList[i] - '0'
            for (x in 9 downTo d + 1) {
                if (lastIndex[x] > i) {
                    val temp = numList[i]
                    numList[i] = numList[lastIndex[x]]
                    numList[lastIndex[x]] = temp
                    return String(numList).toInt()
                }
            }
        }
        return num
    }
}
