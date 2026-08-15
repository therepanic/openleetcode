class Solution {
    func minOperations(_ logs: [String]) -> Int {
        var output = 0
        for log in logs {
            if log == "../" {
                output -= 1
                if output < 0 { output = 0 }
            } else if log == "./" {
                continue
            } else {
                output += 1
            }
        }
        return output < 0 ? 0 : output
    }
}
