class Solution {
    fun flipAndInvertImage(image: Array<IntArray>): Array<IntArray> {
        for (row in image) {
            var left = 0
            var right = row.size - 1
            while (left <= right) {
                val temp = 1 - row[right]
                row[right] = 1 - row[left]
                row[left] = temp
                left++
                right--
            }
        }
        return image
    }
}
