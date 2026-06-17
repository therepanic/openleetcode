# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[][]}
def k_smallest_pairs(nums1, nums2, k)
    return [] if nums1.empty? || nums2.empty?

    require 'set'
    heap = []
    visited = Set.new
    result = []

    less = ->(a, b) {
        (a[0] <=> b[0]).nonzero? || (a[1] <=> b[1]).nonzero? || (a[2] <=> b[2])
    }

    push = ->(sum, i, j) {
        heap << [sum, i, j]
        idx = heap.length - 1
        while idx > 0
            parent = (idx - 1) / 2
            break if less.call(heap[parent], heap[idx]) <= 0
            heap[parent], heap[idx] = heap[idx], heap[parent]
            idx = parent
        end
    }

    pop = -> {
        return nil if heap.empty?
        top = heap[0]
        last = heap.pop
        unless heap.empty?
            heap[0] = last
            idx = 0
            loop do
                left = idx * 2 + 1
                right = left + 1
                smallest = idx
                if left < heap.length && less.call(heap[left], heap[smallest]) < 0
                    smallest = left
                end
                if right < heap.length && less.call(heap[right], heap[smallest]) < 0
                    smallest = right
                end
                break if smallest == idx
                heap[idx], heap[smallest] = heap[smallest], heap[idx]
                idx = smallest
            end
        end
        top
    }

    push.call(nums1[0] + nums2[0], 0, 0)
    visited.add([0, 0])

    while !heap.empty? && result.length < k
        sum, i, j = pop.call
        result << [nums1[i], nums2[j]]

        if j + 1 < nums2.length && !visited.include?([i, j + 1])
            visited.add([i, j + 1])
            push.call(nums1[i] + nums2[j + 1], i, j + 1)
        end

        if i + 1 < nums1.length && !visited.include?([i + 1, j])
            visited.add([i + 1, j])
            push.call(nums1[i + 1] + nums2[j], i + 1, j)
        end
    end

    result
end
