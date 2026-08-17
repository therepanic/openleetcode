func areSentencesSimilar(sentence1 string, sentence2 string) bool {
    s1 := strings.Split(sentence1, " ")
    s2 := strings.Split(sentence2, " ")
    
    l1, l2, r1, r2 := 0, 0, len(s1)-1, len(s2)-1
    
    for l1 <= r1 && l2 <= r2 {
        if s1[l1] == s2[l2] {
            l1++
            l2++
        } else if s1[r1] == s2[r2] {
            r1--
            r2--
        } else {
            return false
        }
    }
    
    return true
}
