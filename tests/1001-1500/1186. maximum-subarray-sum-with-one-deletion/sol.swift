class Solution {
    func maximumSum(_ arr: [Int]) -> Int {
        let n = arr.count
        if n == 1 {
            return arr[0]
        }
        
        var maxNoDelete = arr[0]
        var maxOneDelete = arr[0]
        var result = arr[0]
        
        for i in 1..<n {
            let prevNoDelete = maxNoDelete
            maxNoDelete = max(maxNoDelete + arr[i], arr[i])
            maxOneDelete = max(maxOneDelete + arr[i], prevNoDelete)
            result = max(result, max(maxNoDelete, maxOneDelete))
        }
        
        return result
    }
}
