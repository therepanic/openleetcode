func findRestaurant(list1 []string, list2 []string) []string {
    mp := make(map[string]int)
    mp[list1[0]] = math.MinInt32
    for i := 1; i < len(list1); i++ {
        mp[list1[i]] = -i
    }
    if _, ok := mp[list2[0]]; !ok {
        mp[list2[0]] = math.MinInt32
    } else {
        if mp[list2[0]] != math.MinInt32 {
            if mp[list2[0]] < 0 {
                mp[list2[0]] = -mp[list2[0]]
            } else {
                mp[list2[0]] = mp[list2[0]]
            }
        } else {
            mp[list2[0]] = 0
        }
    }
    for i := 1; i < len(list2); i++ {
        if v, ok := mp[list2[i]]; ok {
            if v != math.MinInt32 {
                abs := v
                if abs < 0 {
                    abs = -abs
                }
                mp[list2[i]] = abs + i
            } else {
                mp[list2[i]] = i
            }
        } else {
            mp[list2[i]] = -i
        }
    }
    minVal := math.MaxInt32
    for _, v := range mp {
        if v >= 0 && v < minVal {
            minVal = v
        }
    }
    ans := []string{}
    for k, v := range mp {
        if v >= 0 && v == minVal {
            ans = append(ans, k)
        }
    }
    return ans
}
