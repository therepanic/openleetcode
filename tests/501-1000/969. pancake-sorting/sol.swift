class Solution {
    func pancakeSort(_ arr: [Int]) -> [Int] {
        var arr = arr
        let n = arr.count
        var result = [Int]()
        
        for i in 0..<n {
            let target = n - i
            var position = 0
            
            for j in 0..<n - i {
                if arr[j] == target {
                    position = j
                    break
                }
            }
            
            if position == n - i - 1 {
                continue
            }
            
            if position > 0 {
                result.append(position + 1)
                arr[0...position].reverse()
            }
            
            result.append(n - i)
            arr[0..<n - i].reverse()
        }
        
        return result
    }
}
