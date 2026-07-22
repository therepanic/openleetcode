class Solution {
    func numberWays(_ hats: [[Int]]) -> Int {
        let mod = 1_000_000_007
        let n = hats.count
        var likedByHat = [[Int]](repeating: [], count: 41)
        for (person, choices) in hats.enumerated() {
            for hat in choices {
                likedByHat[hat].append(person)
            }
        }
        
        var dp = [Int](repeating: 0, count: 1 << n)
        dp[0] = 1
        for hat in 1...40 {
            var updated = dp
            for mask in 0..<(1 << n) {
                let count = dp[mask]
                if count == 0 { continue }
                for person in likedByHat[hat] {
                    let personBit = 1 << person
                    if mask & personBit == 0 {
                        let target = mask | personBit
                        updated[target] = (updated[target] + count) % mod
                    }
                }
            }
            dp = updated
        }
        return dp[(1 << n) - 1]
    }
}
