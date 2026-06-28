type Pair struct {
    sum int
    i   int
    j   int
}

type MinHeap []Pair

func (h MinHeap) Len() int           { return len(h) }
func (h MinHeap) Less(i, j int) bool {
    if h[i].sum != h[j].sum {
        return h[i].sum < h[j].sum
    }
    if h[i].i != h[j].i {
        return h[i].i < h[j].i
    }
    return h[i].j < h[j].j
}
func (h MinHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }

func (h *MinHeap) Push(x interface{}) {
    *h = append(*h, x.(Pair))
}

func (h *MinHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}

func kSmallestPairs(nums1 []int, nums2 []int, k int) [][]int {
    if len(nums1) == 0 || len(nums2) == 0 {
        return [][]int{}
    }

    h := &MinHeap{}
    heap.Init(h)
    visited := map[[2]int]bool{{0, 0}: true}
    heap.Push(h, Pair{nums1[0] + nums2[0], 0, 0})

    result := [][]int{}
    for h.Len() > 0 && len(result) < k {
        cur := heap.Pop(h).(Pair)
        i, j := cur.i, cur.j
        result = append(result, []int{nums1[i], nums2[j]})

        if j+1 < len(nums2) && !visited[[2]int{i, j + 1}] {
            visited[[2]int{i, j + 1}] = true
            heap.Push(h, Pair{nums1[i] + nums2[j+1], i, j + 1})
        }

        if i+1 < len(nums1) && !visited[[2]int{i + 1, j}] {
            visited[[2]int{i + 1, j}] = true
            heap.Push(h, Pair{nums1[i+1] + nums2[j], i + 1, j})
        }
    }

    return result
}
