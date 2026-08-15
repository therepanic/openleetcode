class Solution {
    func numberOfRounds(_ loginTime: String, _ logoutTime: String) -> Int {
        func toMinutes(_ t: String) -> Int {
            let parts = t.split(separator: ":").map { Int($0)! }
            return parts[0] * 60 + parts[1]
        }

        let start = toMinutes(loginTime)
        var end = toMinutes(logoutTime)

        if end < start {
            end += 24 * 60
        }

        let startRound = (start + 14) / 15
        let endRound = end / 15

        return max(0, endRound - startRound)
    }
}
