class Solution {
    func checkOverlap(_ radius: Int, _ xCenter: Int, _ yCenter: Int, _ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Bool {
        let nearestX = max(x1, min(x2, xCenter))
        let nearestY = max(y1, min(y2, yCenter))
        let dist = (nearestX - xCenter) * (nearestX - xCenter) + (nearestY - yCenter) * (nearestY - yCenter)
        return dist <= radius * radius
    }
}
