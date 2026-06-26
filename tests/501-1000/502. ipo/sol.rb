# @param {Integer} k
# @param {Integer} w
# @param {Integer[]} profits
# @param {Integer[]} capital
# @return {Integer}
def find_maximized_capital(k, w, profits, capital)
    projects = profits.each_index.map { |i| [capital[i], profits[i]] }.sort
    heap = []
    push = lambda do |value|
        heap << value
        idx = heap.length - 1
        while idx > 0
            parent = (idx - 1) / 2
            break if heap[parent] >= heap[idx]
            heap[parent], heap[idx] = heap[idx], heap[parent]
            idx = parent
        end
    end
    pop = lambda do
        result = heap[0]
        last = heap.pop
        unless heap.empty?
            heap[0] = last
            idx = 0
            loop do
                left = idx * 2 + 1
                right = left + 1
                best = idx
                best = left if left < heap.length && heap[left] > heap[best]
                best = right if right < heap.length && heap[right] > heap[best]
                break if best == idx
                heap[idx], heap[best] = heap[best], heap[idx]
                idx = best
            end
        end
        result
    end

    idx = 0
    k.times do
        while idx < projects.length && projects[idx][0] <= w
            push.call(projects[idx][1])
            idx += 1
        end
        break if heap.empty?
        w += pop.call
    end
    w
end
