func minRefuelStops(target int, startFuel int, stations [][]int) int {
	heap := make([]int, 0)
	push := func(value int) {
		heap = append(heap, value)
		for i := len(heap) - 1; i > 0; {
			parent := (i - 1) / 2
			if heap[parent] >= heap[i] {
				break
			}
			heap[parent], heap[i] = heap[i], heap[parent]
			i = parent
		}
	}
	pop := func() int {
		result := heap[0]
		heap[0] = heap[len(heap)-1]
		heap = heap[:len(heap)-1]
		for i := 0; ; {
			left := i*2 + 1
			if left >= len(heap) {
				break
			}
			largest := left
			right := left + 1
			if right < len(heap) && heap[right] > heap[left] {
				largest = right
			}
			if heap[i] >= heap[largest] {
				break
			}
			heap[i], heap[largest] = heap[largest], heap[i]
			i = largest
		}
		return result
	}

	fuel := int64(startFuel)
	stops := 0
	next := 0
	for fuel < int64(target) {
		for next < len(stations) && int64(stations[next][0]) <= fuel {
			push(stations[next][1])
			next++
		}
		if len(heap) == 0 {
			return -1
		}
		fuel += int64(pop())
		stops++
	}
	return stops
}
