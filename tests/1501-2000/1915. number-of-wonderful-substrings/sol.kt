class Solution {

    fun wonderfulSubstrings(word: String): Long {

        val count = LongArray(1024)

        count[0] = 1

        var mask = 0

        var res = 0L

        for (ch in word) {

            val bit = ch - 'a'

            mask = mask xor (1 shl bit)

            res += count[mask]

            for (i in 0 until 10) {

                res += count[mask xor (1 shl i)]

            }

            count[mask]++

        }

        return res

    }

}
