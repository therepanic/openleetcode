# @param {String} start
# @param {String} result
# @return {Boolean}
def can_transform(start, result)
    n = start.length
    i = j = 0

    while i < n || j < n
        while i < n && start[i] == 'X'
            i += 1
        end
        while j < n && result[j] == 'X'
            j += 1
        end

        if (i == n) ^ (j == n)
            return false
        end

        if i < n && j < n
            if start[i] != result[j]
                return false
            end
            if start[i] == 'L' && j > i
                return false
            end
            if start[i] == 'R' && j < i
                return false
            end
        end

        i += 1
        j += 1
    end

    return true
end
