func entityParser(text string) string {
    entities := map[string]string{
        "&quot":  "\"",
        "&apos":  "'",
        "&amp":   "&",
        "&gt":    ">",
        "&lt":    "<",
        "&frasl": "/",
    }
    
    re := regexp.MustCompile(`&[^;&\s]+;`)
    
    return re.ReplaceAllStringFunc(text, func(match string) string {
        entity := match[:len(match)-1]
        if val, ok := entities[entity]; ok {
            return val
        }
        return match
    })
}
