class Solution {
    func soupServings(_ n: Int) -> Double {
        if n > 5000 {
            return 1.0
        }
        let units = Int(ceil(Double(n) / 25.0))
        var memo = [String: Double]()
        
        func calcProb(_ soupA: Int, _ soupB: Int) -> Double {
            let key = "\(soupA),\(soupB)"
            if let val = memo[key] {
                return val
            }
            if soupA <= 0 && soupB <= 0 {
                return 0.5
            }
            if soupA <= 0 {
                return 1.0
            }
            if soupB <= 0 {
                return 0.0
            }
            let result = 0.25 * (
                calcProb(soupA - 4, soupB) +
                calcProb(soupA - 3, soupB - 1) +
                calcProb(soupA - 2, soupB - 2) +
                calcProb(soupA - 1, soupB - 3)
            )
            memo[key] = result
            return result
        }
        
        return calcProb(units, units)
    }
}
