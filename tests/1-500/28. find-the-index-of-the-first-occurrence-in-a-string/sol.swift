class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if let range = haystack.range(of: needle) {
            return haystack.distance(from: haystack.startIndex, to: range.lowerBound)
        }
        return -1
    }
}
