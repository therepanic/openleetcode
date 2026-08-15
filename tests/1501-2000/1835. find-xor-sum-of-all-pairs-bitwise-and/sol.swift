class Solution {
    func getXORSum(_ arr1: [Int], _ arr2: [Int]) -> Int {
        var x = 0, y = 0
        for v in arr1 {
            x ^= v
        }
        for v in arr2 {
            y ^= v
        }
        return x & y
    }
}
