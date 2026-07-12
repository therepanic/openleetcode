class Solution {
    fun prevPermOpt1(arr: IntArray): IntArray {
        val n = arr.size
        var i = n - 2
        while (i >= 0 && arr[i] <= arr[i + 1]) {
            i--
        }
        if (i < 0) {
            return arr
        }

        var j = n - 1
        while (arr[j] >= arr[i] || (j > i + 1 && arr[j] == arr[j - 1])) {
            j--
        }

        val temp = arr[i]
        arr[i] = arr[j]
        arr[j] = temp
        return arr
    }
}
