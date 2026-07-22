class Solution {
    fun alphabetBoardPath(target: String): String {
        val arr = arrayOf(intArrayOf(0,1,2,3,4), intArrayOf(5,6,7,8,9), intArrayOf(10,11,12,13,14), intArrayOf(15,16,17,18,19), intArrayOf(20,21,22,23,24), intArrayOf(25))
        val word = target.map { it.code - 'a'.code }
        val s = StringBuilder()
        var j = 0
        var k = 0
        if (word[0] % 5 != 0) {
            s.append("D".repeat(word[0] / 5))
        } else {
            s.append("D".repeat(word[0] / 5))
        }
        if (word[0] % 5 >= 0) {
            s.append("R".repeat(word[0] % 5))
        }
        s.append('!')
        for (i in 1 until word.size) {
            for (h in arr.indices) {
                for (l in arr[h].indices) {
                    if (arr[h][l] == word[i-1]) j = h
                    if (arr[h][l] == word[i]) k = h
                }
            }
            if (word[i-1] == 25) {
                if (j > k) {
                    s.append("U".repeat(j - k))
                } else {
                    s.append("D".repeat(k - j))
                }
                if (word[i] % 5 >= word[i-1] % 5) {
                    s.append("R".repeat(word[i] % 5 - word[i-1] % 5))
                } else {
                    s.append("L".repeat(word[i-1] % 5 - word[i] % 5))
                }
            } else {
                if (word[i] % 5 >= word[i-1] % 5) {
                    s.append("R".repeat(word[i] % 5 - word[i-1] % 5))
                } else {
                    s.append("L".repeat(word[i-1] % 5 - word[i] % 5))
                }
                if (j > k) {
                    s.append("U".repeat(j - k))
                } else {
                    s.append("D".repeat(k - j))
                }
            }
            s.append('!')
        }
        return s.toString()
    }
}
