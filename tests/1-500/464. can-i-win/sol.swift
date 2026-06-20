class Solution {
    func canIWin(_ maxChoosableInteger: Int, _ desiredTotal: Int) -> Bool {
        if desiredTotal <= 0 { return true }
        let sum = maxChoosableInteger * (maxChoosableInteger + 1) / 2
        if sum < desiredTotal { return false }
        
        var memo: [Int: Bool] = [:]
        
        func canWin(_ state: Int, _ total: Int) -> Bool {
            if let result = memo[state] { return result }
            
            for i in 1...maxChoosableInteger {
                let bit = 1 << (i - 1)
                if (state & bit) == 0 {
                    if i >= total || !canWin(state | bit, total - i) {
                        memo[state] = true
                        return true
                    }
                }
            }
            memo[state] = false
            return false
        }
        
        return canWin(0, desiredTotal)
    }
}
