class Solution {
    func numFriendRequests(_ ages: [Int]) -> Int {
        var cnt = [Int](repeating: 0, count: 121)
        for age in ages {
            cnt[age] += 1
        }
        var pre = [Int](repeating: 0, count: 122)
        for i in 0..<121 {
            pre[i + 1] = pre[i] + cnt[i]
        }
        var ans = 0
        for age in 15..<121 {
            if cnt[age] > 0 {
                let lower = Int(Double(age) * 0.5 + 7)
                let total = pre[age + 1] - pre[lower + 1]
                ans += cnt[age] * (total - 1)
            }
        }
        return ans
    }
}
