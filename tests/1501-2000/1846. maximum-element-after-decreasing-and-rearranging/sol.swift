class Solution {
    func maximumElementAfterDecrementingAndRearranging(_ arr: [Int]) -> Int {
        var arr = arr
        arr.sort()
        arr[0] = 1
        for i in 1..<arr.count {
            arr[i] = min(arr[i], arr[i - 1] + 1)
        }
        return arr[arr.count - 1]
    }
}
