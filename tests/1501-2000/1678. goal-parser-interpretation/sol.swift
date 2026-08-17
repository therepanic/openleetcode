class Solution {
    func interpret(_ command: String) -> String {
        var result = ""
        var i = 0
        let chars = Array(command)
        while i < chars.count {
            if chars[i] == "G" {
                result += "G"
                i += 1
            } else if i + 1 < chars.count && String(chars[i...i+1]) == "()" {
                result += "o"
                i += 2
            } else {
                result += "al"
                i += 4
            }
        }
        return result
    }
}
