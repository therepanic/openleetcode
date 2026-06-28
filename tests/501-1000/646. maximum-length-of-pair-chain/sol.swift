class Solution {
    func findLongestChain(_ pairs: [[Int]]) -> Int {
        let sortedPairs = pairs.sorted { $0[1] < $1[1] }
        var prev = sortedPairs[0]
        var res = 1
        for cur in sortedPairs[1...] {
            if cur[0] > prev[1] {
                res += 1
                prev = cur
            }
        }
        return res
    }
}
