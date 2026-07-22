class Solution {
    func circularPermutation(_ n: Int, _ start: Int) -> [Int] {
        var result = [Int]()
        for i in 0..<(1 << n) {
            result.append(start ^ (i ^ (i >> 1)))
        }
        return result
    }
}
