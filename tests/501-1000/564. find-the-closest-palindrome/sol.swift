class Solution {
    func nearestPalindromic(_ n: String) -> String {
        let num = Int64(n)!

        func pow10(_ exp: Int) -> Int64 {
            var value: Int64 = 1
            for _ in 0..<exp {
                value *= 10
            }
            return value
        }

        func makePalindrome(_ left: String) -> Int64 {
            let rightSource = n.count % 2 == 0 ? left : String(left.dropLast())
            let right = String(rightSource.reversed())
            return Int64(left + right)!
        }

        let prefixLen = (n.count + 1) / 2
        var candidates: Set<Int64> = [pow10(n.count - 1) - 1, pow10(n.count) + 1]
        let prefix = Int64(n.prefix(prefixLen))!
        for delta in -1...1 {
            let candidatePrefix = prefix + Int64(delta)
            if candidatePrefix >= 0 {
                let left = String(candidatePrefix)
                if left.count == prefixLen {
                    candidates.insert(makePalindrome(left))
                }
            }
        }

        var best: Int64 = -1
        for candidate in candidates where candidate != num {
            if best == -1 ||
                abs(candidate - num) < abs(best - num) ||
                (abs(candidate - num) == abs(best - num) && candidate < best) {
                best = candidate
            }
        }

        return String(best)
    }
}
