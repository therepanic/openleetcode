class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let parts = nums.map { String($0) }.sorted { $0 + $1 > $1 + $0 }
        if !parts.isEmpty && parts[0] == "0" { return "0" }
        return parts.joined()
    }
}
