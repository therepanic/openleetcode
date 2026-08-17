class Solution {
    func numDifferentIntegers(_ word: String) -> Int {
        var i = 0
        let n = word.count
        var st = Set<String>()
        var chars = Array(word)
        while i < n {
            while i < n && chars[i].isLetter {
                i += 1
            }
            var tempInt = ""
            while i < n && chars[i].isNumber {
                tempInt.append(chars[i])
                i += 1
            }
            var j = 0
            while j + 1 < tempInt.count && tempInt[tempInt.index(tempInt.startIndex, offsetBy: j)] == "0" {
                j += 1
            }
            let start = tempInt.index(tempInt.startIndex, offsetBy: j)
            let k = String(tempInt[start...])
            if !k.isEmpty {
                st.insert(k)
            }
        }
        return st.count
    }
}
