import (
	"container/heap"
	"math"
)

func smallestRange(nums [][]int) []int {
    h := &MinHeap{}
    curMax := math.MinInt32
    for i, arr := range nums {
        heap.Push(h, []int{arr[0], i, 0})
        if arr[0] > curMax {
            curMax = arr[0]
        }
    }
    small := []int{math.MinInt32, math.MaxInt32}
    for h.Len() > 0 {
        cur := heap.Pop(h).([]int)
        curMin, listIdx, i := cur[0], cur[1], cur[2]
        if curMax - curMin < small[1] - small[0] {
            small[0], small[1] = curMin, curMax
        }
        if i + 1 < len(nums[listIdx]) {
            nxt := nums[listIdx][i+1]
            heap.Push(h, []int{nxt, listIdx, i+1})
            if nxt > curMax {
                curMax = nxt
            }
        } else {
            break
        }
    }
    return small
}

type MinHeap [][]int

func (h MinHeap) Len() int           { return len(h) }
func (h MinHeap) Less(i, j int) bool { return h[i][0] < h[j][0] }
func (h MinHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }

func (h *MinHeap) Push(x interface{}) {
    *h = append(*h, x.([]int))
}

func (h *MinHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}
