# @param {Integer[][]} classes
# @param {Integer} extra_students
# @return {Float}
def max_average_ratio(classes, extra_students)
    gain = ->(p, t) { (p + 1.0) / (t + 1) - p.to_f / t }
    pq = classes.map { |p, t| [-gain.call(p, t), p, t] }
    require 'algorithms'
    heap = Containers::Heap.new { |a, b| a[0] < b[0] }
    pq.each { |item| heap.push(item) }
    extra_students.times do
        g, p, t = heap.pop
        p, t = p + 1, t + 1
        heap.push([-gain.call(p, t), p, t])
    end
    total = 0.0
    initial_size = heap.size
    initial_size.times do
        item = heap.pop
        total += item[1].to_f / item[2]
    end
    total / classes.length
end
