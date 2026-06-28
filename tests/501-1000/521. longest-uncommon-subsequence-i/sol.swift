class Solution {
    func findLUSlength(_ a: String, _ b: String) -> Int {
        if a == b {
            return -1
        } else {
            return max(a.count, b.count)
        }
    }
}
