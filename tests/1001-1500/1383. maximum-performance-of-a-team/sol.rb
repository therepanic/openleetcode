def heap_push(heap, value)
  heap << value
  index = heap.length - 1
  while index > 0
    parent = (index - 1) / 2
    break if heap[parent] <= heap[index]
    heap[parent], heap[index] = heap[index], heap[parent]
    index = parent
  end
end

def heap_pop(heap)
  result = heap[0]
  last = heap.pop
  if !heap.empty?
    heap[0] = last
    index = 0
    loop do
      left = index * 2 + 1
      right = left + 1
      smallest = index
      smallest = left if left < heap.length && heap[left] < heap[smallest]
      smallest = right if right < heap.length && heap[right] < heap[smallest]
      break if smallest == index
      heap[index], heap[smallest] = heap[smallest], heap[index]
      index = smallest
    end
  end
  result
end

def max_performance(n, speed, efficiency, k)
  pairs = efficiency.zip(speed).sort_by { |pair| -pair[0] }
  heap = []
  sum = 0
  best = 0
  pairs.each do |efficiency_value, speed_value|
    if heap.length == k
      sum -= heap_pop(heap)
    end
    heap_push(heap, speed_value)
    sum += speed_value
    best = [best, sum * efficiency_value].max
  end
  best % 1_000_000_007
end
