func reformatNumber(number string) string {
    phoneCleared := ""
    for _, ch := range number {
        if ch >= '0' && ch <= '9' {
            phoneCleared += string(ch)
        }
    }
    
    result := []string{}
    for len(phoneCleared) > 4 {
        result = append(result, phoneCleared[:3])
        phoneCleared = phoneCleared[3:]
    }
    
    if len(phoneCleared) == 4 {
        result = append(result, phoneCleared[:2], phoneCleared[2:])
    } else if len(phoneCleared) > 0 {
        result = append(result, phoneCleared)
    }
    
    return strings.Join(result, "-")
}
