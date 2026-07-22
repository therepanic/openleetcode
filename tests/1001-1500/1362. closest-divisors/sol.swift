class Solution {
    func closestDivisors(_ num: Int) -> [Int] {
        let start = Int(Double(num + 2).squareRoot())
        for d in stride(from: start, through: 1, by: -1) {
            if (num + 1) % d == 0 {
                return [d, (num + 1) / d]
            }
            if (num + 2) % d == 0 {
                return [d, (num + 2) / d]
            }
        }
        return []
    }
}
