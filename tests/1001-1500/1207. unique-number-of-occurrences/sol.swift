class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var d = [Int: Int]()
        for i in arr {
            if let count = d[i] {
                d[i] = count + 1
            } else {
                d[i] = 1
            }
        }
        var s = Set<Int>()
        for value in d.values {
            if s.contains(value) {
                return false
            }
            s.insert(value)
        }
        return true
    }
}
