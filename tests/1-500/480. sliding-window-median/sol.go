import "container/heap"

type MinHeap []int

func (h MinHeap) Len() int            { return len(h) }
func (h MinHeap) Less(i, j int) bool  { return h[i] < h[j] }
func (h MinHeap) Swap(i, j int)       { h[i], h[j] = h[j], h[i] }
func (h *MinHeap) Push(x interface{}) { *h = append(*h, x.(int)) }
func (h *MinHeap) Pop() interface{} {
	old := *h
	n := len(old)
	x := old[n-1]
	*h = old[:n-1]
	return x
}

type MaxHeap []int

func (h MaxHeap) Len() int            { return len(h) }
func (h MaxHeap) Less(i, j int) bool  { return h[i] > h[j] }
func (h MaxHeap) Swap(i, j int)       { h[i], h[j] = h[j], h[i] }
func (h *MaxHeap) Push(x interface{}) { *h = append(*h, x.(int)) }
func (h *MaxHeap) Pop() interface{} {
	old := *h
	n := len(old)
	x := old[n-1]
	*h = old[:n-1]
	return x
}

type DualHeap struct {
	small     MaxHeap
	large     MinHeap
	delayed   map[int]int
	k         int
	smallSize int
	largeSize int
}

func NewDualHeap(k int) *DualHeap {
	dh := &DualHeap{
		small:   MaxHeap{},
		large:   MinHeap{},
		delayed: map[int]int{},
		k:       k,
	}
	heap.Init(&dh.small)
	heap.Init(&dh.large)
	return dh
}

func (dh *DualHeap) pruneSmall() {
	for dh.small.Len() > 0 {
		num := dh.small[0]
		if dh.delayed[num] == 0 {
			break
		}
		dh.delayed[num]--
		if dh.delayed[num] == 0 {
			delete(dh.delayed, num)
		}
		heap.Pop(&dh.small)
	}
}

func (dh *DualHeap) pruneLarge() {
	for dh.large.Len() > 0 {
		num := dh.large[0]
		if dh.delayed[num] == 0 {
			break
		}
		dh.delayed[num]--
		if dh.delayed[num] == 0 {
			delete(dh.delayed, num)
		}
		heap.Pop(&dh.large)
	}
}

func (dh *DualHeap) makeBalance() {
	if dh.smallSize > dh.largeSize+1 {
		heap.Push(&dh.large, heap.Pop(&dh.small).(int))
		dh.smallSize--
		dh.largeSize++
		dh.pruneSmall()
	} else if dh.smallSize < dh.largeSize {
		heap.Push(&dh.small, heap.Pop(&dh.large).(int))
		dh.smallSize++
		dh.largeSize--
		dh.pruneLarge()
	}
}

func (dh *DualHeap) insert(num int) {
	if dh.small.Len() == 0 || num <= dh.small[0] {
		heap.Push(&dh.small, num)
		dh.smallSize++
	} else {
		heap.Push(&dh.large, num)
		dh.largeSize++
	}
	dh.makeBalance()
}

func (dh *DualHeap) erase(num int) {
	dh.delayed[num]++
	if num <= dh.small[0] {
		dh.smallSize--
		if num == dh.small[0] {
			dh.pruneSmall()
		}
	} else {
		dh.largeSize--
		if dh.large.Len() > 0 && num == dh.large[0] {
			dh.pruneLarge()
		}
	}
	dh.makeBalance()
}

func (dh *DualHeap) median() float64 {
	if dh.k%2 == 1 {
		return float64(dh.small[0])
	}
	return (float64(dh.small[0]) + float64(dh.large[0])) / 2.0
}

func medianSlidingWindow(nums []int, k int) []float64 {
	dh := NewDualHeap(k)
	for i := 0; i < k; i++ {
		dh.insert(nums[i])
	}
	ans := make([]float64, 0, len(nums)-k+1)
	ans = append(ans, dh.median())
	for i := k; i < len(nums); i++ {
		dh.insert(nums[i])
		dh.erase(nums[i-k])
		ans = append(ans, dh.median())
	}
	return ans
}
