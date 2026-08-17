# @param {Integer[][]} logs
# @return {Integer}
def maximum_population(logs)
    l = logs.length
    a = []
    r = 0
    y = 0
    logs.each { |i| a << i[0] }
    for j in 0...l
        c = 0
        for k in 0...l
            if a[j] >= logs[k][0] && a[j] < logs[k][1] && j != k
                c += 1
            end
        end
        if c > r
            r = c
            y = a[j]
        end
        if c == r && r > 0
            if a[j] < y
                y = a[j]
            end
        end
    end
    return a.min if y == 0
    y
end
