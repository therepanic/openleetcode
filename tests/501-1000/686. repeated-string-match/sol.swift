class Solution {
    func repeatedStringMatch(_ a: String, _ b: String) -> Int {
        var repeatA = a
        var count = 1

        while repeatA.count < b.count {
            repeatA += a
            count += 1
            if repeatA.contains(b) {
                return count
            }
        }

        repeatA += a
        count += 1
        if repeatA.contains(b) {
            return count
        }

        return -1
    }
}
