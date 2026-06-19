class Solution {
    func isRectangleCover(_ rectangles: [[Int]]) -> Bool {
        var area = 0
        var corners = Set<String>()
        
        for rect in rectangles {
            let x = rect[0], y = rect[1], X = rect[2], Y = rect[3]
            area += (X - x) * (Y - y)
            
            let p1 = "\(x),\(y)"
            let p2 = "\(x),\(Y)"
            let p3 = "\(X),\(y)"
            let p4 = "\(X),\(Y)"
            
            if !corners.insert(p1).inserted { corners.remove(p1) }
            if !corners.insert(p2).inserted { corners.remove(p2) }
            if !corners.insert(p3).inserted { corners.remove(p3) }
            if !corners.insert(p4).inserted { corners.remove(p4) }
        }
        
        if corners.count != 4 { return false }
        
        var minX = Int.max, minY = Int.max
        var maxX = Int.min, maxY = Int.min
        
        for point in corners {
            let parts = point.split(separator: ",")
            let x = Int(parts[0])!
            let y = Int(parts[1])!
            minX = min(minX, x)
            minY = min(minY, y)
            maxX = max(maxX, x)
            maxY = max(maxY, y)
        }
        
        return (maxX - minX) * (maxY - minY) == area
    }
}
