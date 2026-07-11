# @param {Integer[]} fronts
# @param {Integer[]} backs
# @return {Integer}
def flipgame(fronts, backs)
    bad = Set.new
    fronts.zip(backs).each do |a, b|
        bad.add(a) if a == b
    end
    best = 2001
    fronts.zip(backs).each do |a, b|
        if !bad.include?(a) && a < best
            best = a
        end
        if !bad.include?(b) && b < best
            best = b
        end
    end
    best <= 2000 ? best : 0
end
