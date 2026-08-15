class Solution {
    func minTimeToType(_ word: String) -> Int {
        var answer = 0
        var pointer = Character("a")
        
        for char in word {
            let clockwise = abs(Int(char.asciiValue!) - Int(pointer.asciiValue!))
            let counterclockwise = 26 - clockwise
            answer += min(clockwise, counterclockwise) + 1
            pointer = char
        }
        
        return answer
    }
}
