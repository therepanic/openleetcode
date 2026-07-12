class Solution {
    func consecutiveNumbersSum(_ n: Int) -> Int {
        let maxSequenceLength = Int((sqrt(Double(1 + 8 * n)) - 1) / 2)
        if maxSequenceLength < 2 {
            return 1
        }
        var c = 0
        for i in 2...maxSequenceLength {
            if i % 2 == 1 && n % i == 0 {
                c += 1
            } else if i % 2 == 0 && n % i == i / 2 {
                c += 1
            }
        }
        return c + 1
    }
}
