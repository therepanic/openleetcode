func numMatchingSubseq(s string, words []string) int {
    n := len(s)
    mp := make(map[byte][]int)
    for i := 0; i < n; i++ {
        mp[s[i]] = append(mp[s[i]], i)
    }
    for c := byte('a'); c <= byte('z'); c++ {
        list := mp[c]
        list = append(list, n)
        mp[c] = list
    }
    
    found := func(word string) bool {
        curr := -1
        for i := 0; i < len(word); i++ {
            if curr >= n {
                return false
            }
            arr := mp[word[i]]
            idx := sort.SearchInts(arr, curr+1)
            curr = arr[idx]
        }
        return curr < n
    }
    
    cnt := 0
    for _, word := range words {
        if found(word) {
            cnt++
        }
    }
    return cnt
}
