class Solution {
    fun longestSubstring(s: String, k: Int): Int {
        var longestLen = 0
        val n = s.length

        for (targetUniqueChars in 1..26) {
            val charFreq = IntArray(26)
            var uniqueChars = 0
            var charsMeetingKFreq = 0
            var left = 0

            for (right in 0 until n) {
                val currIdx = s[right] - 'a'

                if (charFreq[currIdx] == 0) {
                    uniqueChars++
                }
                if (charFreq[currIdx] == k - 1) {
                    charsMeetingKFreq++
                }
                charFreq[currIdx]++

                while (uniqueChars > targetUniqueChars) {
                    val leftIdx = s[left] - 'a'

                    if (charFreq[leftIdx] == 1) {
                        uniqueChars--
                    }
                    if (charFreq[leftIdx] == k) {
                        charsMeetingKFreq--
                    }
                    charFreq[leftIdx]--
                    left++
                }

                if (uniqueChars == targetUniqueChars && charsMeetingKFreq == uniqueChars) {
                    longestLen = maxOf(longestLen, right - left + 1)
                }
            }
        }

        return longestLen
    }
}
