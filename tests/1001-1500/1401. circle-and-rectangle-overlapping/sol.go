func checkOverlap(radius int, xCenter int, yCenter int, x1 int, y1 int, x2 int, y2 int) bool {
    nearestX := max(x1, min(x2, xCenter))
    nearestY := max(y1, min(y2, yCenter))
    dist := (nearestX - xCenter) * (nearestX - xCenter) + (nearestY - yCenter) * (nearestY - yCenter)
    return dist <= radius * radius
}
