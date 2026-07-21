# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {String}
def longest_diverse_string(a, b, c)
    heap = []
    res = []
    [['a', a], ['b', b], ['c', c]].each do |char, count|
        heap << [-count, char] if count > 0
    end
    heap.sort_by! { |x| x[0] }

    while !heap.empty?
        count, char = heap.shift
        if res.length >= 2 && res[-2] == res[-1] && res[-1] == char
            break if heap.empty?
            count_2, char_2 = heap.shift
            res << char_2
            count_2 += 1
            if count_2 < 0
                heap << [count_2, char_2]
                heap.sort_by! { |x| x[0] }
            end
        else
            res << char
            count += 1
        end

        if count < 0
            heap << [count, char]
            heap.sort_by! { |x| x[0] }
        end
    end

    res.join
end
