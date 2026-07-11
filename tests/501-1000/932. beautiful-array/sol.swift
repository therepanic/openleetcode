class Solution {
    func beautifulArray(_ n: Int) -> [Int] {
        if n == 1 {
            return [1]
        }
        
        let left = beautifulArray((n + 1) / 2)
        let right = beautifulArray(n / 2)
        
        var result = [Int]()
        
        for x in left {
            result.append(2 * x - 1)
        }
        for x in right {
            result.append(2 * x)
        }
        
        return result
    }
}
