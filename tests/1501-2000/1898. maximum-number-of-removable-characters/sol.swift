class Solution {
    func maximumRemovals(_ s: String, _ p: String, _ removable: [Int]) -> Int {
        let sArr = Array(s)
        let pArr = Array(p)
        var left = 0, right = removable.count
        var maxK = 0
        while left <= right {
            let mid = (left + right) / 2
            var removed = Array(repeating: false, count: sArr.count)
            for i in 0..<mid {
                removed[removable[i]] = true
            }
            var j = 0
            for i in 0..<sArr.count {
                if j >= pArr.count { break }
                if !removed[i] && sArr[i] == pArr[j] {
                    j += 1
                }
            }
            if j == pArr.count {
                maxK = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return maxK
    }
}
