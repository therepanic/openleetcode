class Solution {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        if firstList.isEmpty || secondList.isEmpty {
            return []
        }
        
        let n = firstList.count, m = secondList.count
        var res: [[Int]] = []
        var i = 0, j = 0
        
        while i < n && j < m {
            let s1 = firstList[i][0], e1 = firstList[i][1]
            let s2 = secondList[j][0], e2 = secondList[j][1]
            
            if e1 >= s2 && s1 <= e2 {
                res.append([max(s1, s2), min(e1, e2)])
            }
            
            if e1 > e2 {
                j += 1
            } else {
                i += 1
            }
        }
        
        return res
    }
}
