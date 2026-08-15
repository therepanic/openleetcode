class Solution {
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        guard let idx = word.firstIndex(of: ch) else { return word }
        var chars = Array(word)
        let endIdx = word.distance(from: word.startIndex, to: idx)
        var left = 0
        var right = endIdx
        while left < right {
            chars.swapAt(left, right)
            left += 1
            right -= 1
        }
        return String(chars)
    }
}
