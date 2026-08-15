def minimum_jumps(forbidden, a, b, x)
    idx = 1
    (2..[a, b].min).each do |i|
        idx = i if a % i == 0 && b % i == 0
    end
    return -1 if x % idx != 0
    q = [[0, 1, 0]]
    visited = Set.new
    visited.add(0)
    forbidden.each { |f| visited.add(f) }
    top = forbidden.max
    limit = top + x + a + b
    while !q.empty?
        curr, prev, step = q.shift
        return step if curr == x
        if prev == 1
            nb = curr - b
            if nb >= 0 && !visited.include?(nb)
                visited.add(nb)
                q.push([nb, -1, step + 1])
            end
        end
        na = curr + a
        if na <= limit && !visited.include?(na)
            visited.add(na)
            q.push([na, 1, step + 1])
        end
    end
    -1
end
