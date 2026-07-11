class Solution {
    func minAddToMakeValid(_ s: String) -> Int {
        var l: [Character] = ["0"]
        for i in s {
            if l.last == "(" && i == ")" {
                l.removeLast()
            } else {
                l.append(i)
            }
        }
        return l.count - 1
    }
}
