class Solution {
    func escapeGhosts(_ ghosts: [[Int]], _ target: [Int]) -> Bool {
        var a: [Int] = []
        for i in ghosts {
            a.append(abs(i[0] - target[0]) + abs(i[1] - target[1]))
        }
        
        let z = abs(target[0] - 0) + abs(target[1] - 0)
        
        var ans = true
        for i in a {
            if i <= z {
                ans = false
            }
        }
        
        return ans
    }
}
