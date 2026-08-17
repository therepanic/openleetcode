# @param {Integer[]} encoded
# @return {Integer[]}
def decode(encoded)
    n = encoded.length + 1
    xr = 0
    (1..n).each { |i| xr ^= i }
    nxr = 0
    encoded.each_with_index do |val, i|
        nxr ^= val if i.odd?
    end
    perm = [xr ^ nxr]
    encoded.each_with_index do |val, i|
        perm << (val ^ perm[i])
    end
    perm
end
