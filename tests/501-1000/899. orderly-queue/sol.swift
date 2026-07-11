class Solution {
    func orderlyQueue(_ s: String, _ k: Int) -> String {
        if k > 1 {
            return String(s.sorted())
        }
        
        var res = s
        var current = s
        for _ in 0..<s.count {
            current = String(current.dropFirst()) + String(current.prefix(1))
            if current < res {
                res = current
            }
        }
        
        return res
    }
}
