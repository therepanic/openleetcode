class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        var arr = arr
        var maxElement = -1
        for i in (0..<arr.count).reversed() {
            let temp = arr[i]
            arr[i] = maxElement
            maxElement = max(maxElement, temp)
        }
        return arr
    }
}
