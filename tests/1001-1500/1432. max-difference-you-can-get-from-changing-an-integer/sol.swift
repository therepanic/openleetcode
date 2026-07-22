class Solution {
    func maxDiff(_ num: Int) -> Int {
        let numStr = String(num)
        let uniqueDigits = Set(numStr)
        var maxVal = num
        var minVal = num
        
        for digit in uniqueDigits {
            for newDigit in "0123456789" {
                if numStr.first == digit && newDigit == "0" {
                    continue
                }
                let newNumStr = numStr.replacingOccurrences(of: String(digit), with: String(newDigit))
                if let newNum = Int(newNumStr) {
                    maxVal = max(maxVal, newNum)
                    minVal = min(minVal, newNum)
                }
            }
        }
        
        return maxVal - minVal
    }
}
