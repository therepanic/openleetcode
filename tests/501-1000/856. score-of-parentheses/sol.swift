class Solution {
    func scoreOfParentheses(_ s: String) -> Int {
        var scoreStack = [0]
        
        for parentheses in s {
            if parentheses == "(" {
                scoreStack.append(0)
            } else if !scoreStack.isEmpty {
                let lastScore = scoreStack.removeLast()
                scoreStack[scoreStack.count - 1] += max(1, lastScore * 2)
            }
        }
        
        return scoreStack.last!
    }
}
