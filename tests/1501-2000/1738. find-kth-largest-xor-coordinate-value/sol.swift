class Solution {
    func kthLargestValue(_ matrix: [[Int]], _ k: Int) -> Int {
        let n = matrix.count
        let m = matrix[0].count
        var temp = Array(repeating: Array(repeating: 0, count: m), count: n)
        temp[0][0] = matrix[0][0]
        for j in 1..<m {
            temp[0][j] = temp[0][j-1] ^ matrix[0][j]
        }
        for i in 1..<n {
            temp[i][0] = temp[i-1][0] ^ matrix[i][0]
        }
        for i in 1..<n {
            for j in 1..<m {
                temp[i][j] = matrix[i][j] ^ temp[i-1][j] ^ temp[i][j-1] ^ temp[i-1][j-1]
            }
        }
        var arr: [Int] = []
        for row in temp {
            arr.append(contentsOf: row)
        }
        arr.sort(by: >)
        return arr[k-1]
    }
}
