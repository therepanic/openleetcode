class Solution {
    func defangIPaddr(_ address: String) -> String {
        var s = ""
        for i in address {
            if i == "." {
                s += "[.]"
            } else {
                s += String(i)
            }
        }
        return s
    }
}
