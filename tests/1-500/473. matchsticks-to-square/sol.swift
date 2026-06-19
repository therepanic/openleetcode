class Solution {
    func makesquare(_ matchsticks: [Int]) -> Bool {
        let total = matchsticks.reduce(0, +)
        if total % 4 != 0 { return false }
        let side = total / 4
        
        var matchsticks = matchsticks.sorted(by: >)
        var sides = [0, 0, 0, 0]
        return backtrack(&matchsticks, 0, &sides, side)
    }
    
    func backtrack(_ matchsticks: inout [Int], _ index: Int, _ sides: inout [Int], _ side: Int) -> Bool {
        if index == matchsticks.count {
            return sides[0] == side && sides[1] == side && sides[2] == side && sides[3] == side
        }
        for i in 0..<4 {
            if sides[i] + matchsticks[index] <= side {
                sides[i] += matchsticks[index]
                if backtrack(&matchsticks, index + 1, &sides, side) { return true }
                sides[i] -= matchsticks[index]
            }
        }
        return false
    }
}
