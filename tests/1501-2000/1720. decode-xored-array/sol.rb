# @param {Integer[]} encoded
# @param {Integer} first
# @return {Integer[]}
def decode(encoded, first)
    arr = [first]
    encoded.each do |e|
        arr << (arr[-1] ^ e)
    end
    arr
end
