# @param {Integer[]} target
# @param {Integer} n
# @return {String[]}
def build_array(target, n)
    s = []
    res = []
    a = 0
    (1..n).each do |i|
        return res if s == target
        s.push(i)
        res.push("Push")
        if s[a] != target[a]
            s.pop
            res.push("Pop")
        else
            a += 1
        end
    end
    res
end
