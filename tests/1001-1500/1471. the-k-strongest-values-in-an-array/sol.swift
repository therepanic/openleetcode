class Solution {
    func getStrongest(_ arr: [Int], _ k: Int) -> [Int] {
        var arr = arr.sorted()
        let m = arr[(arr.count - 1) / 2]
        
        var left = 0
        var right = arr.count - 1
        var result = [Int]()
        for _ in 0..<k {
            if abs(arr[right] - m) >= abs(arr[left] - m) {
                result.append(arr[right])
                right -= 1
            } else {
                result.append(arr[left])
                left += 1
            }
        }
        return result
    }
}
