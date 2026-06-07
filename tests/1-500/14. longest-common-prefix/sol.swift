class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        let strs = strs.sorted()
        let first = Array(strs.first!)
        let last = Array(strs.last!)
        var i = 0
        while i < first.count && i < last.count && first[i] == last[i] {
            i += 1
        }
        return String(first.prefix(i))
    }
}
