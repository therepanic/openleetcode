func threeSumMulti(arr []int, target int) int {
    sort.Ints(arr)
    cnt := make(map[int]int)
    for _, x := range arr {
        cnt[x]++
    }
    var res int64 = 0
    i, l := 0, len(arr)
    MOD := int64(1_000_000_007)
    
    for i < l {
        j, k := i, l-1
        
        for j < k {
            s := arr[i] + arr[j] + arr[k]
            if s < target {
                j += cnt[arr[j]]
            } else if s > target {
                k -= cnt[arr[k]]
            } else {
                if arr[i] != arr[j] && arr[j] != arr[k] {
                    res += int64(cnt[arr[i]] * cnt[arr[j]] * cnt[arr[k]])
                } else if arr[i] == arr[j] && arr[j] != arr[k] {
                    c := int64(cnt[arr[i]])
                    res += c * (c - 1) * int64(cnt[arr[k]]) / 2
                } else if arr[i] != arr[j] && arr[j] == arr[k] {
                    c := int64(cnt[arr[j]])
                    res += int64(cnt[arr[i]]) * c * (c - 1) / 2
                } else {
                    c := int64(cnt[arr[i]])
                    res += c * (c - 1) * (c - 2) / 6
                }
                j += cnt[arr[j]]
                k -= cnt[arr[k]]
            }
        }
        
        i += cnt[arr[i]]
    }
    
    return int(res % MOD)
}
