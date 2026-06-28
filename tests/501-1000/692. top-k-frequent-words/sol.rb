# @param {String[]} words
# @param {Integer} k
# @return {String[]}
def top_k_frequent(words, k)
  counter = Hash.new(0)
  words.each { |w| counter[w] += 1 }
  heap = counter.map { |w, f| [-f, w] }
  heap.sort!
  heap.take(k).map { |_f, w| w }
end
