class Solution {
    func getMinSwaps(_ num: String, _ k: Int) -> Int {
        var arr = Array(num)
        var target = Array(num)
        
        for _ in 0..<k {
            nextPermutation(&target)
        }
        
        var swaps = 0
        arr = Array(num)
        
        for i in 0..<arr.count {
            if arr[i] == target[i] { continue }
            
            var j = i
            while arr[j] != target[i] { j += 1 }
            
            while j > i {
                arr.swapAt(j, j - 1)
                j -= 1
                swaps += 1
            }
        }
        
        return swaps
    }
    
    private func nextPermutation(_ arr: inout [Character]) {
        var i = arr.count - 2
        while i >= 0 && arr[i] >= arr[i + 1] { i -= 1 }
        if i == -1 { return }
        
        var j = arr.count - 1
        while arr[j] <= arr[i] { j -= 1 }
        
        arr.swapAt(i, j)
        
        var left = i + 1, right = arr.count - 1
        while left < right {
            arr.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}
