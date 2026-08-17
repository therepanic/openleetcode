class Solution {
    func maxRepeating(_ sequence: String, _ word: String) -> Int {
        var temp = word
        var res = 0
        while sequence.contains(temp) {
            res += 1
            temp += word
        }
        return res
    }
}
