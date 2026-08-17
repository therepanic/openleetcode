func maxSumRangeQuery(nums []int, requests [][]int) int {
    type event struct {
        pos int
        delta int
    }
    events := make([]event, 0, len(requests)*2)
    mod := 1000000007
    
    for _, req := range requests {
        events = append(events, event{req[0], 1})
        events = append(events, event{req[1]+1, -1})
    }
    
    sort.Slice(events, func(i, j int) bool {
        return events[i].pos < events[j].pos
    })
    
    cnt := 0
    prev := -1
    weight := make(map[int]int64)
    
    for _, e := range events {
        if prev != -1 && cnt != 0 {
            weight[cnt] += int64(e.pos - prev)
        }
        prev = e.pos
        cnt += e.delta
    }
    
    type wItem struct {
        cnt int
        num int64
    }
    wList := make([]wItem, 0, len(weight))
    for k, v := range weight {
        wList = append(wList, wItem{k, v})
    }
    sort.Slice(wList, func(i, j int) bool {
        return wList[i].cnt > wList[j].cnt
    })
    
    sort.Sort(sort.Reverse(sort.IntSlice(nums)))
    ans := 0
    idx := 0
    
    for _, item := range wList {
        for i := int64(0); i < item.num; i++ {
            ans = (ans + nums[idx]*item.cnt) % mod
            idx++
        }
    }
    
    return ans
}
