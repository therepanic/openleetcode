func scoreOfParentheses(s string) int {
    scoreStack := []int{0}
    
    for _, parentheses := range s {
        if parentheses == '(' {
            scoreStack = append(scoreStack, 0)
        } else if len(scoreStack) > 0 {
            lastScore := scoreStack[len(scoreStack)-1]
            scoreStack = scoreStack[:len(scoreStack)-1]
            scoreStack[len(scoreStack)-1] += max(1, lastScore*2)
        }
    }
    
    return scoreStack[len(scoreStack)-1]
}
