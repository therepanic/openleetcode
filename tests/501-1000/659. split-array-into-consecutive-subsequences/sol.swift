class Solution {
    func isPossible(_ nums: [Int]) -> Bool {
        var count = [Int: Int]()
        var subseq = [Int: Int]()

        for num in nums {
            count[num, default: 0] += 1
        }

        for num in nums {
            if count[num] == 0 { continue }
            if subseq[num - 1, default: 0] > 0 {
                subseq[num - 1]! -= 1
                subseq[num, default: 0] += 1
            } else if count[num + 1, default: 0] > 0 && count[num + 2, default: 0] > 0 {
                count[num + 1]! -= 1
                count[num + 2]! -= 1
                subseq[num + 2, default: 0] += 1
            } else {
                return false
            }
            count[num]! -= 1
        }

        return true
    }
}
