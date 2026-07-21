func destCity(paths [][]string) string {
    startCities := make(map[string]bool)
    
    for _, path := range paths {
        startCities[path[0]] = true
    }
    
    for _, path := range paths {
        if !startCities[path[1]] {
            return path[1]
        }
    }
    
    return ""
}
