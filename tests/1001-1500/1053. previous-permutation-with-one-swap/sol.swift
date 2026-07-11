class Solution {
    func prevPermOpt1(_ arr: [Int]) -> [Int] {
        var arr = arr
        let n = arr.count
        var i = n - 2
        while i >= 0 && arr[i] <= arr[i + 1] {
            i -= 1
        }
        if i < 0 {
            return arr
        }

        var j = n - 1
        while arr[j] >= arr[i] || (j > i + 1 && arr[j] == arr[j - 1]) {
            j -= 1
        }

        arr.swapAt(i, j)
        return arr
    }
}
