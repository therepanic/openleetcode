func longestSubstring(s string, k int) int {
    longestLen := 0
    n := len(s)

    for targetUniqueChars := 1; targetUniqueChars <= 26; targetUniqueChars++ {
        charFreq := make([]int, 26)
        uniqueChars := 0
        charsMeetingKFreq := 0
        left := 0

        for right := 0; right < n; right++ {
            currIdx := s[right] - 'a'

            if charFreq[currIdx] == 0 {
                uniqueChars++
            }
            if charFreq[currIdx] == k-1 {
                charsMeetingKFreq++
            }
            charFreq[currIdx]++

            for uniqueChars > targetUniqueChars {
                leftIdx := s[left] - 'a'

                if charFreq[leftIdx] == 1 {
                    uniqueChars--
                }
                if charFreq[leftIdx] == k {
                    charsMeetingKFreq--
                }
                charFreq[leftIdx]--
                left++
            }

            if uniqueChars == targetUniqueChars && charsMeetingKFreq == uniqueChars {
                if right-left+1 > longestLen {
                    longestLen = right - left + 1
                }
            }
        }
    }

    return longestLen
}
