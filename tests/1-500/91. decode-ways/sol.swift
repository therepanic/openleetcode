class Solution {
    func numDecodings(_ s: String) -> Int {
        let chars = Array(s)
        if chars.isEmpty || chars[0] == "0" {
            return 0
        }

        var prev2 = 1
        var prev1 = 1
        if chars.count == 1 {
            return prev1
        }

        for i in 1..<chars.count {
            var curr = 0
            if chars[i] != "0" {
                curr += prev1
            }
            let tens = chars[i - 1].wholeNumberValue!
            let ones = chars[i].wholeNumberValue!
            let value = tens * 10 + ones
            if value >= 10 && value <= 26 {
                curr += prev2
            }
            prev2 = prev1
            prev1 = curr
        }

        return prev1
    }
}
