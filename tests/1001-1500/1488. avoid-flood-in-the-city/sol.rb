# @param {Integer[]} rains
# @return {Integer[]}
def avoid_flood(rains)
    res = Array.new(rains.size, -1)
    full = {}
    size = rains.size
    tree = Array.new(size + 1, 0)

    add = lambda do |index, delta|
        index += 1
        while index <= size
            tree[index] += delta
            index += index & -index
        end
    end

    prefix = lambda do |count|
        total = 0
        while count > 0
            total += tree[count]
            count -= count & -count
        end
        total
    end

    kth = lambda do |rank|
        index = 0
        step = 1
        step <<= 1 while (step << 1) <= size
        while step > 0
            next_index = index + step
            if next_index <= size && tree[next_index] < rank
                index = next_index
                rank -= tree[next_index]
            end
            step >>= 1
        end
        index
    end

    rains.each_with_index do |lake, i|
        if lake == 0
            add.call(i, 1)
            res[i] = 1
        elsif full.key?(lake)
            before = prefix.call(full[lake] + 1)
            available = prefix.call(size) - before
            if available == 0
                return []
            end
            j = kth.call(before + 1)
            res[j] = lake
            add.call(j, -1)
            full[lake] = i
        else
            full[lake] = i
        end
    end
    res
end
