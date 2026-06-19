class Solution {
    func countSegments(_ s: String) -> Int {
        var c = 0
        let chars = Array(s)
        for i in 0..<chars.count {
            if chars[i] != " " && (i == 0 || chars[i - 1] == " ") {
                c += 1
            }
        }
        return c
    }
}
