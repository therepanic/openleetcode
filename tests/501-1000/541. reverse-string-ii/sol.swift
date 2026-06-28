class Solution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        var arr = Array(s)
        let step = 2 * k
        var i = 0
        while i < arr.count {
            var start = i
            var end = min(i + k - 1, arr.count - 1)
            while start < end {
                arr.swapAt(start, end)
                start += 1
                end -= 1
            }
            i += step
        }
        return String(arr)
    }
}
