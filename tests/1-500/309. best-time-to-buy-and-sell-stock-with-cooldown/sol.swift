class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var a = Int.min
        var b = 0
        var c = 0
        for p in prices {
            let newA = max(a, c - p)
            let newB = a + p
            let newC = max(c, b)
            a = newA
            b = newB
            c = newC
        }
        return max(b, c)
    }
}
