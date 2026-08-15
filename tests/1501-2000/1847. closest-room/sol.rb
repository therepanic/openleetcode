# @param {Integer[][]} rooms
# @param {Integer[][]} queries
# @return {Integer[]}
def closest_room(rooms, queries)
    rooms.sort_by! { |r| -r[1] }
    indexed = queries.each_with_index.sort_by { |q, i| -q[1] }

    active = []
    result = Array.new(queries.length, -1)

    indexed.each do |query, qi|
        preferred = query[0]
        minimum = query[1]

        while !rooms.empty? && rooms[0][1] >= minimum
            active << rooms.shift[0]
        end

        active.sort!

        pos = active.bsearch_index { |x| x >= preferred }
        candidates = []
        if pos
            candidates << active[pos]
        elsif !active.empty?
            candidates << active[-1]
        end
        if pos && pos > 0
            candidates << active[pos - 1]
        end

        if !candidates.empty?
            result[qi] = candidates.min_by { |id| [(id - preferred).abs, id] }
        end
    end

    result
end
