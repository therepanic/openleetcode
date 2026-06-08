class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]([[]])
        for x in nums {
            let sz = res.count
            for i in 0..<sz {
                var cur = res[i]
                cur.append(x)
                res.append(cur)
            }
        }
        return res
    }
}
