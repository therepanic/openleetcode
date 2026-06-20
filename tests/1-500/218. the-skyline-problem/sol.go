import (
    "container/heap"
    "sort"
)

func getSkyline(buildings [][]int) [][]int {
    type Event struct {
        x int
        h int
    }
    events := make([]Event, 0)
    for _, b := range buildings {
        L, R, H := b[0], b[1], b[2]
        events = append(events, Event{L, -H})
        events = append(events, Event{R, H})
    }
    sort.Slice(events, func(i, j int) bool {
        if events[i].x != events[j].x {
            return events[i].x < events[j].x
        }
        return events[i].h < events[j].h
    })

    result := make([][]int, 0)
    liveBuildings := &MaxHeap{}
    heap.Init(liveBuildings)
    heap.Push(liveBuildings, 0)
    pastBuildings := make(map[int]int)
    prevMax := 0

    for _, e := range events {
        if e.h < 0 {
            heap.Push(liveBuildings, -e.h)
        } else {
            pastBuildings[e.h]++
        }

        for liveBuildings.Len() > 0 && pastBuildings[(*liveBuildings)[0]] > 0 {
            top := heap.Pop(liveBuildings).(int)
            pastBuildings[top]--
            if pastBuildings[top] == 0 {
                delete(pastBuildings, top)
            }
        }

        currMax := (*liveBuildings)[0]
        if currMax != prevMax {
            result = append(result, []int{e.x, currMax})
            prevMax = currMax
        }
    }
    return result
}

type MaxHeap []int

func (h MaxHeap) Len() int            { return len(h) }
func (h MaxHeap) Less(i, j int) bool  { return h[i] > h[j] } // max heap
func (h MaxHeap) Swap(i, j int)       { h[i], h[j] = h[j], h[i] }

func (h *MaxHeap) Push(x interface{}) {
    *h = append(*h, x.(int))
}

func (h *MaxHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}
