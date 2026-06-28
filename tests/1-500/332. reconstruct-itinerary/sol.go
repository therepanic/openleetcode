func findItinerary(tickets [][]string) []string {
    graph := make(map[string][]string)
    
    for _, ticket := range tickets {
        from, to := ticket[0], ticket[1]
        graph[from] = append(graph[from], to)
    }
    
    for key := range graph {
        sort.Sort(sort.Reverse(sort.StringSlice(graph[key])))
    }
    
    st := []string{"JFK"}
    newItinerary := []string{}
    
    for len(st) > 0 {
        top := st[len(st)-1]
        if len(graph[top]) > 0 {
            lastIdx := len(graph[top]) - 1
            st = append(st, graph[top][lastIdx])
            graph[top] = graph[top][:lastIdx]
        } else {
            newItinerary = append(newItinerary, top)
            st = st[:len(st)-1]
        }
    }
    
    for i, j := 0, len(newItinerary)-1; i < j; i, j = i+1, j-1 {
        newItinerary[i], newItinerary[j] = newItinerary[j], newItinerary[i]
    }
    
    return newItinerary
}
