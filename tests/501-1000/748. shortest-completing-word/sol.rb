# @param {String} license_plate
# @param {String[]} words
# @return {String}
def shortest_completing_word(license_plate, words)
    lp = Hash.new(0)
    license_plate.downcase.each_char { |c| lp[c] += 1 if c.match?(/[a-z]/) }
    ans = nil
    words.each do |w|
        cw = Hash.new(0)
        w.each_char { |c| cw[c] += 1 }
        ok = lp.all? { |c, cnt| cw.fetch(c, 0) >= cnt }
        if ok && (ans.nil? || w.length < ans.length)
            ans = w
        end
    end
    ans
end
