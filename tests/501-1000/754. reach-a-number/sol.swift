class Solution {
    func reachNumber(_ target: Int) -> Int {
        let target = abs(target)
        let n = Int((-1 + sqrt(Double(1 + 8 * target))) / 2)
        let a = n * (n + 1) / 2
        let b = a + n + 1
        
        if a == target {
            return n
        }
        if (b - target) % 2 == 0 {
            return n + 1
        }
        return (n + 2) % 2 == 1 ? n + 2 : n + 3
    }
}
