class Solution {
    func longestMountain(_ arr: [Int]) -> Int {
        let n = arr.count
        var best = 0
        var i = 1
        
        while i < n - 1 {
            if arr[i - 1] < arr[i] && arr[i] > arr[i + 1] {
                var left = i - 1
                var right = i + 1
                while left > 0 && arr[left - 1] < arr[left] {
                    left -= 1
                }
                while right < n - 1 && arr[right] > arr[right + 1] {
                    right += 1
                }
                best = max(best, right - left + 1)
                i = right
            }
            i += 1
        }
        
        return best
    }
}
