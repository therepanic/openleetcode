class Solution {
    func findNumbers(_ nums: [Int]) -> Int {
        var count = 0
        for i in nums {
            let msb = i.bitWidth - i.leadingZeroBitCount - 1
            var digits = Int(Double(msb) * 0.30103) + 1
            if Double(i) >= pow(10.0, Double(digits)) {
                digits += 1
            }
            if digits % 2 == 0 {
                count += 1
            }
        }
        return count
    }
}
