# @param {String[]} words
# @return {String[]}
def common_chars(words)
  freq = Hash.new(0)
  words[0].each_char { |c| freq[c] += 1 }

  words[1..].each do |word|
    f = Hash.new(0)
    word.each_char { |c| f[c] += 1 }
    freq.each_key do |c|
      if f.key?(c)
        freq[c] = [f[c], freq[c]].min
      else
        freq[c] = 0
      end
    end
  end

  res = []
  freq.each do |c, count|
    count.times { res << c } if count > 0
  end
  res
end
