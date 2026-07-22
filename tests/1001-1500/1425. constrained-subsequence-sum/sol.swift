class Solution {
    func constrainedSubsetSum(_ nums: [Int], _ k: Int) -> Int {
        var q = [(Int, Int)]()
        var res = Int.min
        for (i, num) in nums.enumerated() {
            let total = q.isEmpty ? num : num + q[0].1
            res = max(res, total)
            while !q.isEmpty && total >= q.last!.1 {
                q.removeLast()
            }
            if total > 0 {
                q.append((i, total))
            }
            if !q.isEmpty && q[0].0 == i - k {
                q.removeFirst()
            }
        }
        return res
    }
}
