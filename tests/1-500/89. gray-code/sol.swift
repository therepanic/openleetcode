class Solution {
    func grayCode(_ n: Int) -> [Int] {
        let total = 1 << n
        var res: [Int] = []
        res.reserveCapacity(total)
        for i in 0..<total { res.append(i ^ (i >> 1)) }
        return res
    }
}
