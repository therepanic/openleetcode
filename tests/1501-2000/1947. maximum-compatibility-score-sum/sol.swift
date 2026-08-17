class Solution {
    func maxCompatibilitySum(_ students: [[Int]], _ mentors: [[Int]]) -> Int {
        let m = students.count
        var maxScore = 0
        var perm = Array(0..<m)
        repeat {
            var total = 0
            for i in 0..<m {
                for j in 0..<students[i].count {
                    if students[i][j] == mentors[perm[i]][j] { total += 1 }
                }
            }
            maxScore = max(maxScore, total)
        } while nextPermutation(&perm)
        return maxScore
    }
    
    func nextPermutation(_ a: inout [Int]) -> Bool {
        let n = a.count
        var i = n - 2
        while i >= 0 && a[i] >= a[i+1] { i -= 1 }
        if i < 0 { return false }
        var j = n - 1
        while a[j] <= a[i] { j -= 1 }
        a.swapAt(i, j)
        var l = i+1, r = n-1
        while l < r {
            a.swapAt(l, r)
            l += 1; r -= 1
        }
        return true
    }
}
