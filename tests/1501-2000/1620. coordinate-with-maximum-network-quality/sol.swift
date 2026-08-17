class Solution {
    func bestCoordinate(_ towers: [[Int]], _ radius: Int) -> [Int] {
        var maxX = 0
        var maxY = 0
        for t in towers {
            maxX = max(maxX, t[0])
            maxY = max(maxY, t[1])
        }
        
        var bestQuality = 0
        var bestCoord = [0, 0]
        
        for x in 0...maxX {
            for y in 0...maxY {
                var quality = 0
                for t in towers {
                    let dist = sqrt(Double((t[0] - x) * (t[0] - x) + (t[1] - y) * (t[1] - y)))
                    if dist <= Double(radius) {
                        quality += Int(Double(t[2]) / (1 + dist))
                    }
                }
                if quality > bestQuality || (quality == bestQuality && (x < bestCoord[0] || (x == bestCoord[0] && y < bestCoord[1]))) {
                    bestQuality = quality
                    bestCoord[0] = x
                    bestCoord[1] = y
                }
            }
        }
        
        return bestCoord
    }
}
