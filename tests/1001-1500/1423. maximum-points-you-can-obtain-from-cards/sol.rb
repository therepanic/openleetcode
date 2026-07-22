# @param {Integer[]} card_points
# @param {Integer} k
# @return {Integer}
def max_score(card_points, k)
    l = 0
    total = card_points[card_points.length - k..-1].sum
    res = total
    (card_points.length - k...card_points.length).each do |r|
        total += card_points[l] - card_points[r]
        res = [res, total].max
        l += 1
    end
    res
end
