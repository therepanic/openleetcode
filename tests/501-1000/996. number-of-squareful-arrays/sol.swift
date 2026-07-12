class Solution {
    func numSquarefulPerms(_ nums: [Int]) -> Int {
        let n = nums.count
        let sortedNums = nums.sorted()

        func isSquareful(_ currNums: [Int], _ num: Int) -> Bool {
            if currNums.isEmpty { return true }
            let prevNum = currNums.last!
            let pairSum = prevNum + num
            if pairSum < 0 { return false }
            let sqrtN = Int(Double(pairSum).squareRoot())
            return sqrtN * sqrtN == pairSum
        }

        var memo = [String: Int]()

        func backtrack(_ numsMask: Int, _ currNums: [Int]) -> Int {
            if numsMask != 0 && currNums.count == n { return 1 }
            var total = 0
            for idx in 0..<n {
                let num = sortedNums[idx]
                if idx > 0 && sortedNums[idx] == sortedNums[idx - 1] && (numsMask & (1 << (idx - 1))) == 0 {
                    continue
                }
                if (numsMask & (1 << idx)) == 0 && isSquareful(currNums, num) {
                    var newCurr = currNums
                    newCurr.append(num)
                    total += backtrack(numsMask | (1 << idx), newCurr)
                }
            }
            return total
        }

        return backtrack(0, [])
    }
}
