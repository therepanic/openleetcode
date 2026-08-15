class Solution {
    func placeWordInCrossword(_ board: [[Character]], _ word: String) -> Bool {
        func canPlace(_ segment: [Character], _ w: String) -> Bool {
            if segment.count != w.count { return false }
            let chars = Array(w)
            for i in 0..<segment.count {
                if segment[i] != " " && segment[i] != chars[i] { return false }
            }
            return true
        }
        
        let m = board.count, n = board[0].count
        let reversedWord = String(word.reversed())
        let wordChars = Array(word)
        let revChars = Array(reversedWord)
        
        for row in board {
            var seg: [Character] = []
            for c in row {
                if c == "#" {
                    if !seg.isEmpty {
                        if canPlace(seg, word) || canPlace(seg, reversedWord) { return true }
                        seg.removeAll()
                    }
                } else {
                    seg.append(c)
                }
            }
            if !seg.isEmpty {
                if canPlace(seg, word) || canPlace(seg, reversedWord) { return true }
            }
        }
        
        for j in 0..<n {
            var seg: [Character] = []
            for i in 0..<m {
                let c = board[i][j]
                if c == "#" {
                    if !seg.isEmpty {
                        if canPlace(seg, word) || canPlace(seg, reversedWord) { return true }
                        seg.removeAll()
                    }
                } else {
                    seg.append(c)
                }
            }
            if !seg.isEmpty {
                if canPlace(seg, word) || canPlace(seg, reversedWord) { return true }
            }
        }
        return false
    }
}
