class Solution {
    func findDifferentBinaryString(_ nums: [String]) -> String {
        return nums.enumerated().map { i, s in
            let index = s.index(s.startIndex, offsetBy: i)
            return s[index] == "0" ? "1" : "0"
        }.joined()
    }
}
