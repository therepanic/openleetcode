func peopleIndexes(favoriteCompanies [][]string) []int {
    sets := make([]map[string]bool, len(favoriteCompanies))
    for i, companies := range favoriteCompanies {
        sets[i] = make(map[string]bool)
        for _, company := range companies {
            sets[i][company] = true
        }
    }
    
    result := []int{}
    
    for i := 0; i < len(sets); i++ {
        isSubset := false
        for j := 0; j < len(sets); j++ {
            if i != j {
                allFound := true
                for company := range sets[i] {
                    if !sets[j][company] {
                        allFound = false
                        break
                    }
                }
                if allFound {
                    isSubset = true
                    break
                }
            }
        }
        if !isSubset {
            result = append(result, i)
        }
    }
    
    return result
}
