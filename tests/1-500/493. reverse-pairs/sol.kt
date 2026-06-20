class Solution {
    fun reversePairs(nums: IntArray): Int {
        fun sortCount(arr: IntArray, left: Int, right: Int): Int {
            if (left >= right) return 0
            val mid = left + (right - left) / 2
            var count = sortCount(arr, left, mid) + sortCount(arr, mid + 1, right)

            var j = mid + 1
            for (i in left..mid) {
                while (j <= right && arr[i].toLong() > 2L * arr[j]) {
                    j++
                }
                count += j - (mid + 1)
            }

            val temp = arr.copyOfRange(left, right + 1)
            var i = 0
            var k = mid + 1 - left
            var t = left
            val endLeft = mid - left
            val endRight = right - left
            while (i <= endLeft && k <= endRight) {
                if (temp[i] <= temp[k]) {
                    arr[t++] = temp[i++]
                } else {
                    arr[t++] = temp[k++]
                }
            }
            while (i <= endLeft) arr[t++] = temp[i++]
            while (k <= endRight) arr[t++] = temp[k++]

            return count
        }

        return sortCount(nums, 0, nums.size - 1)
    }
}
