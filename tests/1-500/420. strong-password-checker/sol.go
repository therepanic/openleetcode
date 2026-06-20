func strongPasswordChecker(password string) int {
    lowercase := map[rune]bool{}
    for _, c := range "abcdefghijklmnopqrstuvwxyz" {
        lowercase[c] = true
    }
    uppercase := map[rune]bool{}
    for _, c := range "ABCDEFGHIJKLMNOPQRSTUVWXYZ" {
        uppercase[c] = true
    }
    digit := map[rune]bool{}
    for _, c := range "0123456789" {
        digit[c] = true
    }
    
    characters := map[rune]bool{}
    for _, c := range password {
        characters[c] = true
    }
    
    needsLowercase := true
    needsUppercase := true
    needsDigit := true
    
    for c := range characters {
        if lowercase[c] {
            needsLowercase = false
        }
        if uppercase[c] {
            needsUppercase = false
        }
        if digit[c] {
            needsDigit = false
        }
    }
    
    numRequiredTypeReplaces := 0
    if needsLowercase {
        numRequiredTypeReplaces++
    }
    if needsUppercase {
        numRequiredTypeReplaces++
    }
    if needsDigit {
        numRequiredTypeReplaces++
    }
    
    numRequiredInserts := 0
    if 6 - len(password) > 0 {
        numRequiredInserts = 6 - len(password)
    }
    
    numRequiredDeletes := 0
    if len(password) - 20 > 0 {
        numRequiredDeletes = len(password) - 20
    }
    
    groups := []int{}
    if len(password) > 0 {
        count := 1
        for i := 1; i < len(password); i++ {
            if password[i] == password[i-1] {
                count++
            } else {
                groups = append(groups, count)
                count = 1
            }
        }
        groups = append(groups, count)
    }
    
    for d := 0; d < numRequiredDeletes; d++ {
        argmin := -1
        minVal := 100
        for i, group := range groups {
            val := 0
            if group >= 3 {
                val = group % 3
            } else {
                val = 10 - group
            }
            if val < minVal {
                minVal = val
                argmin = i
            }
        }
        if argmin != -1 {
            groups[argmin]--
        }
    }
    
    numRequiredGroupReplaces := 0
    for _, group := range groups {
        numRequiredGroupReplaces += group / 3
    }
    
    maxVal := numRequiredTypeReplaces
    if numRequiredGroupReplaces > maxVal {
        maxVal = numRequiredGroupReplaces
    }
    if numRequiredInserts > maxVal {
        maxVal = numRequiredInserts
    }
    
    return numRequiredDeletes + maxVal
}
