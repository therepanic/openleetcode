func subdomainVisits(cpdomains []string) []string {
    freq := make(map[string]int)
    for _, entry := range cpdomains {
        parts := strings.Split(entry, " ")
        cnt, _ := strconv.Atoi(parts[0])
        dom := parts[1]
        subParts := strings.Split(dom, ".")
        for i := range subParts {
            sub := strings.Join(subParts[i:], ".")
            freq[sub] += cnt
        }
    }
    result := make([]string, 0, len(freq))
    for d, c := range freq {
        result = append(result, strconv.Itoa(c) + " " + d)
    }
    return result
}
