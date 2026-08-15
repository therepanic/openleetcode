def assign_tasks(servers, tasks)
    available = []
    busy = []
    cmp = lambda { |a, b| a < b }
    push = lambda do |h, x, c|
        h << x
        i = h.length - 1
        while i > 0
            p = (i - 1) / 2
            break if c.call(h[p], h[i])
            h[p], h[i] = h[i], h[p]
            i = p
        end
    end
    pop = lambda do |h, c|
        top = h[0]
        last = h.pop
        unless h.empty?
            h[0] = last
            i = 0
            loop do
                l = i * 2 + 1
                r = l + 1
                k = i
                k = l if l < h.length && !c.call(h[k], h[l])
                k = r if r < h.length && !c.call(h[k], h[r])
                break if k == i
                h[i], h[k] = h[k], h[i]
                i = k
            end
        end
        top
    end
    ac = lambda { |a, b| a[0] < b[0] || (a[0] == b[0] && a[1] < b[1]) }
    bc = lambda { |a, b| a[0] < b[0] }
    servers.each_with_index { |w, i| push.call(available, [w, i], ac) }
    result = []
    time = 0
    tasks.each_with_index do |duration, i|
        time = i if time < i
        while !busy.empty? && busy[0][0] <= time
            item = pop.call(busy, bc)
            push.call(available, [item[1], item[2]], ac)
        end
        if available.empty?
            time = busy[0][0]
            while !busy.empty? && busy[0][0] <= time
                item = pop.call(busy, bc)
                push.call(available, [item[1], item[2]], ac)
            end
        end
        server = pop.call(available, ac)
        push.call(busy, [time + duration, server[0], server[1]], bc)
        result << server[1]
    end
    result
end
