class Solution {
    private func removeSame(_ s: String, _ i: Int) -> String {
        if i < 0 { return s }
        let chars = Array(s)
        var left = i, right = i
        while left > 0 && chars[left - 1] == chars[i] { left -= 1 }
        while right + 1 < chars.count && chars[right + 1] == chars[i] { right += 1 }
        if right - left + 1 >= 3 {
            let newS = String(chars[0..<left]) + String(chars[(right + 1)...])
            return removeSame(newS, left - 1)
        }
        return s
    }

    func findMinStep(_ board: String, _ hand: String) -> Int {
        let sortedHand = String(hand.sorted())
        var q: [(String, String, Int)] = [(board, sortedHand, 0)]
        var visited: Set<String> = ["\(board)#\(sortedHand)"]

        while !q.isEmpty {
            let (currBoard, currHand, step) = q.removeFirst()
            for i in 0...currBoard.count {
                for j in 0..<currHand.count {
                    let handChars = Array(currHand)
                    if j > 0 && handChars[j] == handChars[j - 1] { continue }
                    if i > 0 {
                        let boardChars = Array(currBoard)
                        if boardChars[i - 1] == handChars[j] { continue }
                    }

                    var pick = false
                    let boardChars = Array(currBoard)
                    if i < currBoard.count && boardChars[i] == handChars[j] { pick = true }
                    if i > 0 && i < currBoard.count &&
                        boardChars[i - 1] == boardChars[i] &&
                        boardChars[i] != handChars[j] { pick = true }

                    if pick {
                        let newBoard = removeSame(
                            String(boardChars[0..<i]) + String(handChars[j]) + String(boardChars[i...]), i
                        )
                        let newHand = String(handChars[0..<j]) + String(handChars[(j + 1)...])
                        if newBoard.isEmpty { return step + 1 }
                        let key = "\(newBoard)#\(newHand)"
                        if !visited.contains(key) {
                            visited.insert(key)
                            q.append((newBoard, newHand, step + 1))
                        }
                    }
                }
            }
        }
        return -1
    }
}
