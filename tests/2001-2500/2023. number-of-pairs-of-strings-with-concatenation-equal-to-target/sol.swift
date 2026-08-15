class Solution {
    func numOfPairs(_ nums: [String], _ target: String) -> Int {
        var freq: [String: Int] = [:]
        for num in nums {
            freq[num, default: 0] += 1
        }

        var totalCnt = 0

        let targetChars = Array(target)
        for num in nums {
            if target.hasPrefix(num) {
                let remain = String(targetChars[num.count...])

                if remain == num {
                    totalCnt += (freq[remain] ?? 0) - 1
                } else {
                    totalCnt += freq[remain] ?? 0
                }
            }
        }

        return totalCnt
    }
}
