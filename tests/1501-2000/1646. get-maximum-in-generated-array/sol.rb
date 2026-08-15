# @param {Integer} n
# @return {Integer}
def get_maximum_generated(n)
    if n == 0
        return 0
    elsif n == 1 || n == 2
        return 1
    else
        a = [0, 1]
        v = 1
        for i in 2..n
            if i % 2 == 0
                a << a[v]
            else
                a << a[v] + a[v + 1]
                v += 1
            end
        end
        return a.max
    end
end
