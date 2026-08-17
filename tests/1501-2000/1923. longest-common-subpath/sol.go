func longestCommonSubpath(n int, paths [][]int) int {
    var combined []int
    var pathOrigin []int
    for i, p := range paths {
        for _, v := range p {
            combined = append(combined, v)
            pathOrigin = append(pathOrigin, i)
        }
        combined = append(combined, -(i+1))
        pathOrigin = append(pathOrigin, i)
    }
    N := len(combined)
    M := len(paths)

    // rank compression
    rank := make([]int, N)
    {
        temp := make([]int, N)
        copy(temp, combined)
        sort.Ints(temp)
        for i := range combined {
            rank[i] = sort.SearchInts(temp, combined[i])
        }
    }

    k := 1
    for k < N {
        key := make([]uint64, N)
        for i := 0; i < N; i++ {
            first := uint64(rank[i])
            second := uint64(0)
            if i+k < N {
                second = uint64(rank[i+k]) + 1
            }
            key[i] = (first << 32) | second
        }
        sortedKey := make([]uint64, N)
        copy(sortedKey, key)
        sort.Slice(sortedKey, func(i, j int) bool { return sortedKey[i] < sortedKey[j] })
        for i := 0; i < N; i++ {
            rank[i] = sort.Search(N, func(j int) bool { return sortedKey[j] >= key[i] })
        }
        if k >= N {
            break
        }
        k *= 2
    }

    sa := make([]int, N)
    for i, r := range rank {
        sa[r] = i
    }

    lcp := make([]int, N)
    inv := make([]int, N)
    copy(inv, rank)
    h := 0
    for i := 0; i < N; i++ {
        if inv[i] > 0 {
            j := sa[inv[i]-1]
            for i+h < N && j+h < N && combined[i+h] == combined[j+h] {
                h++
            }
            lcp[inv[i]] = h
            if h > 0 {
                h--
            }
        }
    }

    ans := 0
    left := 0
    count := make([]int, M)
    distinct := 0
    minQ := []int{}
    for right := 0; right < N; right++ {
        p := pathOrigin[sa[right]]
        if p >= 0 {
            if count[p] == 0 {
                distinct++
            }
            count[p]++
        }
        for len(minQ) > 0 && lcp[minQ[len(minQ)-1]] >= lcp[right] {
            minQ = minQ[:len(minQ)-1]
        }
        minQ = append(minQ, right)

        for distinct == M {
            for len(minQ) > 0 && minQ[0] <= left {
                minQ = minQ[1:]
            }
            if len(minQ) > 0 {
                if lcp[minQ[0]] > ans {
                    ans = lcp[minQ[0]]
                }
            }
            out := pathOrigin[sa[left]]
            if out >= 0 {
                count[out]--
                if count[out] == 0 {
                    distinct--
                }
            }
            left++
        }
    }
    return ans
}
