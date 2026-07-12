class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        func getNextValidCharIndex(_ str: [Character], _ end: Int) -> Int {
            var backspaceCount = 0
            var current = end
            while current >= 0 {
                if str[current] == "#" {
                    backspaceCount += 1
                } else if backspaceCount > 0 {
                    backspaceCount -= 1
                } else {
                    break
                }
                current -= 1
            }
            return current
        }

        let sArr = Array(s)
        let tArr = Array(t)
        var ps = sArr.count - 1
        var pt = tArr.count - 1

        while ps >= 0 || pt >= 0 {
            ps = getNextValidCharIndex(sArr, ps)
            pt = getNextValidCharIndex(tArr, pt)

            if ps < 0 && pt < 0 {
                return true
            }
            if ps < 0 || pt < 0 {
                return false
            } else if sArr[ps] != tArr[pt] {
                return false
            }

            ps -= 1
            pt -= 1
        }

        return true
    }
}
