# @param {Integer} n
# @return {Integer[]}
def construct_distanced_sequence(n)
    result = Array.new(2 * n - 1, 0)
    used = Array.new(n + 1, false)
    backtrack(result, used, n, 0)
    result
end

def backtrack(result, used, n, index)
    while index < result.length && result[index] != 0
        index += 1
    end
    return true if index == result.length

    n.downto(1) do |i|
        next if used[i]

        if i == 1
            result[index] = 1
            used[1] = true
            if backtrack(result, used, n, index + 1)
                return true
            end
            result[index] = 0
            used[1] = false
        elsif index + i < result.length && result[index + i] == 0
            result[index] = i
            result[index + i] = i
            used[i] = true
            if backtrack(result, used, n, index + 1)
                return true
            end
            result[index] = 0
            result[index + i] = 0
            used[i] = false
        end
    end

    false
end
