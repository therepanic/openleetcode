# @param {Integer[]} quality
# @param {Integer[]} wage
# @param {Integer} k
# @return {Float}
def mincost_to_hire_workers(quality, wage, k)
    workers = quality.zip(wage).map { |q, w| [w.to_f / q, q] }.sort_by { |r, _| r }
    
    min_cost = Float::INFINITY
    current_quality_sum = 0
    max_heap = []
    
    workers.each do |ratio, q|
        current_quality_sum += q
        max_heap.push(q)
        max_heap.sort! { |a, b| b <=> a }
        
        if max_heap.size > k
            current_quality_sum -= max_heap.shift
        end
        
        if max_heap.size == k
            min_cost = [min_cost, ratio * current_quality_sum].min
        end
    end
    
    min_cost
end
