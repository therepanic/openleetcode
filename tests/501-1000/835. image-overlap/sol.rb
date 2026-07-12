# @param {Integer[][]} img1
# @param {Integer[][]} img2
# @return {Integer}
def largest_overlap(img1, img2)
    n = img1.length
    a = []
    b = []
    (0...n).each do |i|
        (0...n).each do |j|
            a << [i, j] if img1[i][j] == 1
            b << [i, j] if img2[i][j] == 1
        end
    end
    cnt = Hash.new(0)
    a.each do |x1, y1|
        b.each do |x2, y2|
            cnt[[x1 - x2, y1 - y2]] += 1
        end
    end
    cnt.values.empty? ? 0 : cnt.values.max
end
