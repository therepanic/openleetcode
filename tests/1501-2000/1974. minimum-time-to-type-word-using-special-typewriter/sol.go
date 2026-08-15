func minTimeToType(word string) int {
    answer := 0
    pointer := byte('a')
    
    for i := 0; i < len(word); i++ {
        clockwise := int(word[i]) - int(pointer)
        if clockwise < 0 {
            clockwise = -clockwise
        }
        counterclockwise := 26 - clockwise
        if clockwise < counterclockwise {
            answer += clockwise + 1
        } else {
            answer += counterclockwise + 1
        }
        pointer = word[i]
    }
    
    return answer
}
