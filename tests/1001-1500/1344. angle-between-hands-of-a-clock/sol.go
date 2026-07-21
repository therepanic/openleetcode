func angleClock(hour int, minutes int) float64 {
    return math.Acos(math.Cos((330.0*float64(hour) + 5.5*float64(minutes)) * 0.0174532925)) * 57.2957795
}
