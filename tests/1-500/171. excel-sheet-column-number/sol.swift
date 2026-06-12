class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        var ans = 0
        for scalar in columnTitle.unicodeScalars { ans = ans * 26 + Int(scalar.value) - 64 }
        return ans
    }
}
