class Solution {
    func pathInZigZagTree(_ label: Int) -> [Int] {
        var res: [Int] = []
        var cur = label
        while cur > 0 {
            res.append(cur)
            var start = 1
            while start * 2 <= cur {
                start *= 2
            }
            let end = start * 2 - 1
            cur = (start + end - cur) / 2
        }
        return res.reversed()
    }
}
