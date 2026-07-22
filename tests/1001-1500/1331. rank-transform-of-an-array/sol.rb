# @param {Integer[]} arr
# @return {Integer[]}
def array_rank_transform(arr)
    s = arr.sort
    unique = []
    s.each do |x|
        if unique.empty? || unique.last != x
            unique << x
        end
    end
    arr.map! do |x|
        bisect_left(unique, x) + 1
    end
    arr
end

def bisect_left(a, x)
    lo = 0
    hi = a.length
    while lo < hi
        mid = (lo + hi) / 2
        if a[mid] < x
            lo = mid + 1
        else
            hi = mid
        end
    end
    lo
end
