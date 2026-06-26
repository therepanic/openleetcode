class Solution {
    func validSquare(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
        func getDistSq(_ pt1: [Int], _ pt2: [Int]) -> Int {
            return (pt1[0] - pt2[0]) * (pt1[0] - pt2[0]) + 
                   (pt1[1] - pt2[1]) * (pt1[1] - pt2[1])
        }
        
        let points = [p1, p2, p3, p4]
        var distances = Set<Int>()
        
        for i in 0..<4 {
            for j in (i + 1)..<4 {
                distances.insert(getDistSq(points[i], points[j]))
            }
        }
        
        return distances.count == 2 && !distances.contains(0)
    }
}
