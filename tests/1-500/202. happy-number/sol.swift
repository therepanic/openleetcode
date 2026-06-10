class Solution {
    func isHappy(_ n: Int) -> Bool {
        var seen = Set<Int>()
        var current = n
        while current != 1 && !seen.contains(current) {
            seen.insert(current)
            current = nextValue(current)
        }
        return current == 1
    }

    private func nextValue(_ n: Int) -> Int {
        var current = n
        var total = 0
        while current > 0 {
            let digit = current % 10
            total += digit * digit
            current /= 10
        }
        return total
    }
}
