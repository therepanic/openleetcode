func getFolderNames(names []string) []string {
    nameCount := make(map[string]int)
    result := make([]string, 0, len(names))

    for _, name := range names {
        if _, exists := nameCount[name]; !exists {
            result = append(result, name)
            nameCount[name] = 1
        } else {
            k := nameCount[name]
            for {
                candidate := fmt.Sprintf("%s(%d)", name, k)
                if _, exists := nameCount[candidate]; !exists {
                    break
                }
                k++
            }
            newName := fmt.Sprintf("%s(%d)", name, k)
            result = append(result, newName)
            nameCount[name] = k + 1
            nameCount[newName] = 1
        }
    }

    return result
}
