# @param {Integer} n
# @param {Integer[][]} paths
# @return {Integer}
def longest_common_subpath(n, paths)
    combined = []
    path_origin = []
    paths.each_with_index do |p, i|
        p.each do |v|
            combined << v
            path_origin << i
        end
        combined << -(i+1)
        path_origin << i
    end
    n = combined.size
    m = paths.size

    # rank compression
    rank = []
    temp = combined.sort
    combined.each do |x|
        rank << temp.index(x)
    end

    k = 1
    while k < n
        keys = []
        (0...n).each do |i|
            first = rank[i]
            second = (i+k < n) ? rank[i+k] + 1 : 0
            keys << ((first << 32) | second)
        end
        sorted = keys.sort
        (0...n).each do |i|
            rank[i] = sorted.index(keys[i])
        end
        break if k >= n
        k *= 2
    end

    sa = Array.new(n, 0)
    (0...n).each do |i|
        sa[rank[i]] = i
    end

    lcp = Array.new(n, 0)
    inv = rank.dup
    h = 0
    (0...n).each do |i|
        if inv[i] > 0
            j = sa[inv[i]-1]
            while i+h < n && j+h < n && combined[i+h] == combined[j+h]
                h += 1
            end
            lcp[inv[i]] = h
            h -= 1 if h > 0
        end
    end

    ans = 0
    left = 0
    count = Array.new(m, 0)
    distinct = 0
    min_q = []
    (0...n).each do |right|
        p = path_origin[sa[right]]
        if p >= 0
            count[p] += 1
            distinct += 1 if count[p] == 1
        end
        while !min_q.empty? && lcp[min_q.last] >= lcp[right]
            min_q.pop
        end
        min_q << right

        while distinct == m
            while !min_q.empty? && min_q.first <= left
                min_q.shift
            end
            ans = [ans, lcp[min_q.first]].max unless min_q.empty?
            out = path_origin[sa[left]]
            if out >= 0
                count[out] -= 1
                distinct -= 1 if count[out] == 0
            end
            left += 1
        end
    end
    ans
end
