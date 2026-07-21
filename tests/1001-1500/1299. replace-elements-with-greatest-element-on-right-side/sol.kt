class Solution {
    fun replaceElements(arr: IntArray): IntArray {
        var maxElement = -1
        for (i in arr.indices.reversed()) {
            val temp = arr[i]
            arr[i] = maxElement
            maxElement = maxOf(maxElement, temp)
        }
        return arr
    }
}
