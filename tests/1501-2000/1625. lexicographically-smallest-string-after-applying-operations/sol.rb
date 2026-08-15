def find_lex_smallest_string(s, a, b)
    n = s.length
    seen = Set.new
    dfs = lambda do |cur|
        return if seen.include?(cur)
        seen.add(cur)
        add = cur.dup
        (1...n).step(2) do |i|
            add[i] = ((add[i].to_i + a) % 10).to_s
        end
        dfs.call(add)
        dfs.call(cur[n-b..] + cur[0...n-b])
    end
    dfs.call(s)
    seen.min
end
