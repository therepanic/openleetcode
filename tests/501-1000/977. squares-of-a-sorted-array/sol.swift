class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var newarr: [Int] = []
        for i in nums {
            newarr.append(i * i)
        }
        newarr.sort()
        return newarr
    }
}
