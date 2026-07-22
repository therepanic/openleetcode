class Solution {
    func kthSmallest(_ mat: [[Int]], _ k: Int) -> Int {
        var sums = Array(mat[0].prefix(k))
        for i in 1..<mat.count {
            let row = Array(mat[i].prefix(k))
            var next = [Int]()
            for a in sums {
                for b in row {
                    next.append(a + b)
                }
            }
            next.sort()
            sums = Array(next.prefix(k))
        }
        return sums[k - 1]
    }
}
