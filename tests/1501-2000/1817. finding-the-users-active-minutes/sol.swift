class Solution {
    func findingUsersActiveMinutes(_ logs: [[Int]], _ k: Int) -> [Int] {
        var mp: [Int: Set<Int>] = [:]
        for log in logs {
            mp[log[0], default: []].insert(log[1])
        }
        var ans = Array(repeating: 0, count: k)
        for set in mp.values {
            let size = set.count
            if size <= k {
                ans[size - 1] += 1
            }
        }
        return ans
    }
}
