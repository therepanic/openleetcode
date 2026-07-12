class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        let n = arr.count
        var i = 0
        
        while i+1 < n && arr[i] < arr[i+1] {
            i += 1
        }
        
        if i == 0 || i == n-1 {
            return false
        }
        
        while i+1 < n && arr[i] > arr[i+1] {
            i += 1
        }
        
        return i == n-1
    }
}
