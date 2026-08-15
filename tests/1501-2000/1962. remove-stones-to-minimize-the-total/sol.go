func minStoneSum(piles []int, k int) int {
    h := append([]int(nil), piles...)
    for i := len(h)/2 - 1; i >= 0; i-- { siftDown(h, i) }
    for i := 0; i < k; i++ {
        x := h[0]
        reduced := (x + 1) / 2
        h[0] = reduced
        siftDown(h, 0)
	}
	sum := 0
	for _, p := range h {
		sum += p
	}
	return sum
}

func siftDown(h []int, i int) {
    for {
        left := i*2 + 1
        if left >= len(h) { return }
        child := left
        if right := left + 1; right < len(h) && h[right] > h[left] { child = right }
        if h[i] >= h[child] { return }
        h[i], h[child] = h[child], h[i]
        i = child
    }
}
