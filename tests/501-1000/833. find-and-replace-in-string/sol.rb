# @param {String} s
# @param {Integer[]} indices
# @param {String[]} sources
# @param {String[]} targets
# @return {String}
def find_replace_string(s, indices, sources, targets)
    patch = {}
    indices.each_with_index do |i, idx|
        src = sources[idx]
        tgt = targets[idx]
        if s[i, src.length] == src
            patch[i] = [src, tgt]
        end
    end
    res = []
    i = 0
    n = s.length
    while i < n
        if patch.key?(i)
            src, tgt = patch[i]
            res << tgt
            i += src.length
        else
            res << s[i]
            i += 1
        end
    end
    res.join('')
end
