class Solution {
    func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
        var ans: [[Int]] = []
        var mp: [Int: [Int]] = [:]
        for (i, v) in groupSizes.enumerated() {
            mp[v, default: []].append(i)
            if mp[v]!.count == v {
                ans.append(mp[v]!)
                mp[v] = []
            }
        }
        return ans
    }
}
