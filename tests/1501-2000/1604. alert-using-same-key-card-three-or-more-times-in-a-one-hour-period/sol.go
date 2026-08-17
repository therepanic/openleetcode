func alertNames(keyName []string, keyTime []string) []string {
    m := make(map[string][]int)
    
    for i, name := range keyName {
        parts := strings.Split(keyTime[i], ":")
        h, _ := strconv.Atoi(parts[0])
        min, _ := strconv.Atoi(parts[1])
        minutes := h*60 + min
        m[name] = append(m[name], minutes)
    }
    
    result := []string{}
    
    for name, times := range m {
        sort.Ints(times)
        for i := 0; i < len(times)-2; i++ {
            if times[i+2] - times[i] <= 60 {
                result = append(result, name)
                break
            }
        }
    }
    
    sort.Strings(result)
    return result
}
