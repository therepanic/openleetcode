class Solution {
    func smallestSufficientTeam(_ req_skills: [String], _ people: [[String]]) -> [Int] {
        let n = req_skills.count
        let full = (1 << n) - 1
        var idx: [String: Int] = [:]
        for (i, skill) in req_skills.enumerated() { idx[skill] = i }

        let masks = people.map { skills -> Int in
            var mask = 0
            for skill in skills { mask |= 1 << idx[skill]! }
            return mask
        }

        var dp = Array<[Int]?>(repeating: nil, count: 1 << n)
        dp[0] = []

        for (i, pmask) in masks.enumerated() {
            if pmask == 0 { continue }
            var next = dp
            for mask in 0...full {
                guard let team = dp[mask] else { continue }
                let nmask = mask | pmask
                var cand = team
                cand.append(i)
                if next[nmask] == nil || cand.count < next[nmask]!.count {
                    next[nmask] = cand
                }
            }
            dp = next
        }

        return dp[full] ?? []
    }
}
