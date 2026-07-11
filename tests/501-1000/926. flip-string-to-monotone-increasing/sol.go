func minFlipsMonoIncr(s string) int {
    zeroes := 0
    ones := 0
    
    for _, ch := range s {
        if ch == '0' {
            zeroes++
        }
    }
    
    output := zeroes
    
    for _, ch := range s {
        if ch == '0' {
            zeroes--
        } else if ch == '1' {
            ones++
        }
        if zeroes+ones < output {
            output = zeroes + ones
        }
    }
    
    return output
}
