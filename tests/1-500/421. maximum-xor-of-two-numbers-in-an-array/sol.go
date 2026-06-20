func findMaximumXOR(nums []int) int {
    maxNum := 0
    for _, num := range nums {
        if num > maxNum {
            maxNum = num
        }
    }
    mxBit := 0
    for maxNum > 0 {
        mxBit++
        maxNum >>= 1
    }
    
    trie := [][]int{{-1, -1}}
    
    insert := func(num int) {
        node := 0
        for i := mxBit - 1; i >= 0; i-- {
            bit := (num >> uint(i)) & 1
            if trie[node][bit] == -1 {
                trie[node][bit] = len(trie)
                trie = append(trie, []int{-1, -1})
            }
            node = trie[node][bit]
        }
    }
    
    getMax := func(num int) int {
        node := 0
        ans := 0
        for i := mxBit - 1; i >= 0; i-- {
            bit := (num >> uint(i)) & 1
            opp := 1 - bit
            if trie[node][opp] != -1 {
                ans |= (1 << uint(i))
                node = trie[node][opp]
            } else {
                node = trie[node][bit]
            }
        }
        return ans
    }
    
    for _, num := range nums {
        insert(num)
    }
    
    res := 0
    for _, num := range nums {
        val := getMax(num)
        if val > res {
            res = val
        }
    }
    
    return res
}
