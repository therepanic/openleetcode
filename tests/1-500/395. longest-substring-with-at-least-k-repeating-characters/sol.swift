class Solution {
    func longestSubstring(_ s: String, _ k: Int) -> Int {
        var longestLen = 0
        let n = s.count
        let arr = Array(s)

        for targetUniqueChars in 1...26 {
            var charFreq = [Int](repeating: 0, count: 26)
            var uniqueChars = 0
            var charsMeetingKFreq = 0
            var left = 0

            for right in 0..<n {
                let currIdx = Int(arr[right].asciiValue! - Character("a").asciiValue!)

                if charFreq[currIdx] == 0 {
                    uniqueChars += 1
                }
                if charFreq[currIdx] == k - 1 {
                    charsMeetingKFreq += 1
                }
                charFreq[currIdx] += 1

                while uniqueChars > targetUniqueChars {
                    let leftIdx = Int(arr[left].asciiValue! - Character("a").asciiValue!)

                    if charFreq[leftIdx] == 1 {
                        uniqueChars -= 1
                    }
                    if charFreq[leftIdx] == k {
                        charsMeetingKFreq -= 1
                    }
                    charFreq[leftIdx] -= 1
                    left += 1
                }

                if uniqueChars == targetUniqueChars && charsMeetingKFreq == uniqueChars {
                    longestLen = max(longestLen, right - left + 1)
                }
            }
        }

        return longestLen
    }
}
