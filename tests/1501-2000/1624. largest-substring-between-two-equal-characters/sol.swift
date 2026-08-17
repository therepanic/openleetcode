class Solution {
    func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
        var firstPos = [Int](repeating: -1, count: 26)
        var lastPos = [Int](repeating: -1, count: 26)
        let arr = Array(s)
        let n = arr.count
        let a = Int(Character("a").asciiValue!)
        for i in 0..<n {
            let idx = Int(arr[i].asciiValue!) - a
            if firstPos[idx] == -1 { firstPos[idx] = i }
        }
        for i in stride(from: n-1, through: 0, by: -1) {
            let idx = Int(arr[i].asciiValue!) - a
            if lastPos[idx] == -1 { lastPos[idx] = i }
        }
        var maxLen = -1
        for i in 0..<26 {
            if firstPos[i] != -1 && lastPos[i] != -1 {
                maxLen = max(maxLen, lastPos[i] - firstPos[i] - 1)
            }
        }
        return maxLen
    }
}
