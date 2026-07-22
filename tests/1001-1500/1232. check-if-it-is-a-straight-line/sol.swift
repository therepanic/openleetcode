class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        var x1 = coordinates[0][0]
        var y1 = coordinates[0][1]
        var x2 = coordinates[1][0]
        var y2 = coordinates[1][1]
        
        var slope: Double
        if x2 == x1 {
            slope = Double.infinity
        } else {
            slope = Double(y2 - y1) / Double(x2 - x1)
        }
        
        let n = coordinates.count
        for i in 1..<n - 1 {
            x1 = coordinates[i][0]
            y1 = coordinates[i][1]
            x2 = coordinates[i + 1][0]
            y2 = coordinates[i + 1][1]
            
            var currSlope: Double
            if x2 == x1 {
                currSlope = Double.infinity
            } else {
                currSlope = Double(y2 - y1) / Double(x2 - x1)
            }
            
            if currSlope != slope {
                return false
            }
        }
        
        return true
    }
}
