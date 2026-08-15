class Solution {
    func findKthBit(_ n: Int, _ k: Int) -> Character {
        if n == 1 {
            return "0"
        }
        
        let length = (1 << n) - 1
        let mid = (length + 1) / 2
        
        if k == mid {
            return "1"
        }
        if k < mid {
            return findKthBit(n - 1, k)
        }
        
        let c = findKthBit(n - 1, length - k + 1)
        return c == "0" ? "1" : "0"
    }
}
