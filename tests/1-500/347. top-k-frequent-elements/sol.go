import "sort"

func topKFrequent(nums []int, k int) []int {
    type info struct {
        count int
        first int
    }
    type kv struct {
        Key   int
        Count int
        First int
    }
    var sorted []kv
    freq := make(map[int]*info)
    for i, x := range nums {
        if cur, ok := freq[x]; ok {
            cur.count++
        } else {
            freq[x] = &info{count: 1, first: i}
        }
    }
    for key, v := range freq {
        sorted = append(sorted, kv{key, v.count, v.first})
    }
    sort.Slice(sorted, func(i, j int) bool {
        if sorted[i].Count != sorted[j].Count {
            return sorted[i].Count > sorted[j].Count
        }
        return sorted[i].First < sorted[j].First
    })
    result := make([]int, k)
    for i := 0; i < k; i++ {
        result[i] = sorted[i].Key
    }
    return result
}
