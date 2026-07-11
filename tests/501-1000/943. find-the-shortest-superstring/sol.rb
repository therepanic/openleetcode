# @param {String[]} words
# @return {String}
def shortest_superstring(words)
    n = words.length
    overlap = Array.new(n) { Array.new(n, 0) }

    get_overlap = lambda do |a, b|
        max_olap = 0
        (1..[a.length, b.length].min).each do |k|
            if a[-k..-1] == b[0...k]
                max_olap = [max_olap, k].max
            end
        end
        max_olap
    end

    (0...n).each do |i|
        (0...n).each do |j|
            if i != j
                overlap[i][j] = get_overlap.call(words[i], words[j])
            end
        end
    end

    dp = Array.new(1 << n) { Array.new(n, "") }
    (0...n).each do |i|
        dp[1 << i][i] = words[i]
    end

    (0...(1 << n)).each do |mask|
        (0...n).each do |u|
            next if (mask & (1 << u)) == 0
            (0...n).each do |v|
                next if (mask & (1 << v)) != 0
                new_mask = mask | (1 << v)
                candidate = dp[mask][u] + words[v][overlap[u][v]..-1]
                if dp[new_mask][v] == "" || candidate.length < dp[new_mask][v].length
                    dp[new_mask][v] = candidate
                end
            end
        end
    end

    short_string = ""
    dp[(1 << n) - 1].each do |candidate|
        if short_string == "" || candidate.length < short_string.length
            short_string = candidate
        end
    end
    short_string
end
