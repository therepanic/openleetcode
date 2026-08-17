class Solution {
    func modifyString(_ s: String) -> String {
        var arr = Array(s)
        let n = arr.count
        for i in 0..<n {
            if arr[i] == "?" {
                let left: Character = i > 0 ? arr[i-1] : " "
                let right: Character = i+1 < n ? arr[i+1] : " "
                if left != "a" && right != "a" {
                    arr[i] = "a"
                } else if left != "b" && right != "b" {
                    arr[i] = "b"
                } else {
                    arr[i] = "c"
                }
            }
        }
        return String(arr)
    }
}
