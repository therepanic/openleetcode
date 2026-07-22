class Solution {
    func dayOfYear(_ date: String) -> Int {
        var val: [Int: Int] = [
            1: 0, 2: 31, 3: 59, 4: 90, 5: 120, 6: 151,
            7: 181, 8: 212, 9: 243, 10: 273, 11: 304, 12: 334
        ]
        let d = Int(date.suffix(2))!
        let m = Int(date[date.index(date.startIndex, offsetBy: 5)..<date.index(date.startIndex, offsetBy: 7)])!
        let y = Int(date.prefix(4))!
        let isLeap = (y % 400 == 0) || (y % 4 == 0 && y % 100 != 0)
        if isLeap {
            for i in 3...12 {
                val[i]! += 1
            }
        }
        return d + val[m]!
    }
}
