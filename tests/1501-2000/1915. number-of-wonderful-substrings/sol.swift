class Solution {

    func wonderfulSubstrings(_ word: String) -> Int {

        var count = [Int](repeating: 0, count: 1024)

        count[0] = 1

        var mask = 0

        var res = 0

        for ch in word {

            let bit = Int(ch.asciiValue! - Character("a").asciiValue!)

            mask ^= 1 << bit

            res += count[mask]

            for i in 0..<10 {

                res += count[mask ^ (1 << i)]

            }

            count[mask] += 1

        }

        return res

    }

}
