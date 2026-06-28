func kthGrammar(n int, k int) int {
    if n == 1 {
        return 0
    }
    parent := kthGrammar(n-1, (k+1)/2)
    if k%2 == 1 {
        return parent
    }
    return 1 - parent
}
