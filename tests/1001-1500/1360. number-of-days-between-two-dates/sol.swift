class Solution {
    func daysBetweenDates(_ date1: String, _ date2: String) -> Int {
        let parts1 = date1.split(separator: "-").compactMap { Int($0) }
        let parts2 = date2.split(separator: "-").compactMap { Int($0) }
        let (y1, m1, d1) = (parts1[0], parts1[1], parts1[2])
        let (y2, m2, d2) = (parts2[0], parts2[1], parts2[2])
        return abs(daysSince1970(y1, m1, d1) - daysSince1970(y2, m2, d2))
    }

    private func daysSince1970(_ y: Int, _ m: Int, _ d: Int) -> Int {
        var year = y
        var month = m
        if month < 3 {
            year -= 1
            month += 12
        }
        return 365 * year + year / 4 - year / 100 + year / 400 + (153 * month - 457) / 5 + d - 306 - 719468
    }
}
