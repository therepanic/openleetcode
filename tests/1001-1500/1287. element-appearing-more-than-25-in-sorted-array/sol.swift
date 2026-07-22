class Solution {
    func findSpecialInteger(_ arr: [Int]) -> Int {
        let n = arr.count
        let q = n / 4
        var m = [Int: Int]()
        for num in arr {
            m[num, default: 0] += 1
            if m[num]! > q {
                return num
            }
        }
        return -1
    }
}
