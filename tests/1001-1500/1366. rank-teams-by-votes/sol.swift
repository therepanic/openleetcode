class Solution {
    func rankTeams(_ votes: [String]) -> String {
        let teams = Array(votes[0])
        let n = teams.count
        var positions = [Character: [Int]]()
        for team in teams {
            positions[team] = Array(repeating: 0, count: n)
        }
        for vote in votes {
            for (index, team) in vote.enumerated() {
                positions[team]![index] += 1
            }
        }
        let sortedTeams = teams.sorted { a, b in
            let countsA = positions[a]!
            let countsB = positions[b]!
            for i in 0..<n {
                if countsA[i] != countsB[i] {
                    return countsA[i] > countsB[i]
                }
            }
            return a.asciiValue! < b.asciiValue!
        }
        return String(sortedTeams)
    }
}
