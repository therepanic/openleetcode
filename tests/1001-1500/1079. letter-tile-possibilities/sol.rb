# @param {String} tiles
# @return {Integer}
def num_tile_possibilities(tiles)
    tiles = tiles.chars.sort
    used = Array.new(tiles.length, false)
    backtrack(tiles, used)
end

def backtrack(tiles, used)
    count = 0
    (0...tiles.length).each do |i|
        next if used[i] || (i > 0 && tiles[i] == tiles[i - 1] && !used[i - 1])
        used[i] = true
        count += 1 + backtrack(tiles, used)
        used[i] = false
    end
    count
end
