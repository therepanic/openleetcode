class Solution {
    func maxChunksToSorted(_ arr: [Int]) -> Int {
        let n = arr.count
        var minRight = [Int](repeating: 0, count: n)
        var currentMin = Int.max
        for i in stride(from: n - 1, through: 0, by: -1) {
            if arr[i] < currentMin {
                currentMin = arr[i]
            }
            minRight[i] = currentMin
        }
        
        var chunks = 0
        var currentMax = Int.min
        for i in 0..<n - 1 {
            if arr[i] > currentMax {
                currentMax = arr[i]
            }
            if currentMax <= minRight[i + 1] {
                chunks += 1
            }
        }
        return chunks + 1
    }
}
