class Solution {
    func isCovered(_ ranges: [[Int]], _ left: Int, _ right: Int) -> Bool {
        var slots = [Int](repeating: 0, count: 51)
        for r in ranges {
            let s = r[0], e = r[1]
            if s <= e {
                for i in s...e {
                    slots[i] = 1
                }
            }
        }
        for i in left...right {
            if slots[i] == 0 {
                return false
            }
        }
        return true
    }
}
