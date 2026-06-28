class Solution {
    func shoppingOffers(_ price: [Int], _ special: [[Int]], _ needs: [Int]) -> Int {
        let p = price.count
        var memo = [[Int]: Int]()
        
        func dp(_ curr: [Int]) -> Int {
            if curr.allSatisfy({ $0 == 0 }) { return 0 }
            if let val = memo[curr] { return val }
            
            let n = curr.count
            var res = 0
            for i in 0..<p {
                res += curr[i] * price[i]
            }
            
            for offer in special {
                var canUse = true
                for i in 0..<n {
                    if curr[i] < offer[i] {
                        canUse = false
                        break
                    }
                }
                if canUse {
                    var newCurr = [Int]()
                    for i in 0..<n {
                        newCurr.append(curr[i] - offer[i])
                    }
                    res = min(res, offer.last! + dp(newCurr))
                }
            }
            
            memo[curr] = res
            return res
        }
        
        return dp(needs)
    }
}
