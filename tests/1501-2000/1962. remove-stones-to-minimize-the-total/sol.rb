# @param {Integer[]} piles
# @param {Integer} k
# @return {Integer}
def min_stone_sum(piles, k)
    heap = piles.map { |p| -p }
    heap.sort!
    k.times do
        x = -heap[0]
        reduced = (x + 1) / 2
        heap[0] = -reduced
        i = 0
        while (child = i * 2 + 1) < heap.length
            child += 1 if child + 1 < heap.length && heap[child + 1] < heap[child]
            break if heap[i] <= heap[child]
            heap[i], heap[child] = heap[child], heap[i]
            i = child
        end
    end
    -heap.sum
end
