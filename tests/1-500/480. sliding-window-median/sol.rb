class Heap
  def initialize(&cmp)
    @data = []
    @cmp = cmp
  end

  def empty?
    @data.empty?
  end

  def size
    @data.length
  end

  def top
    @data[0]
  end

  def push(val)
    @data << val
    i = @data.length - 1
    while i > 0
      p = (i - 1) / 2
      break unless @cmp.call(@data[i], @data[p])
      @data[i], @data[p] = @data[p], @data[i]
      i = p
    end
  end

  def pop
    root = @data[0]
    last = @data.pop
    if !@data.empty?
      @data[0] = last
      i = 0
      loop do
        best = i
        left = i * 2 + 1
        right = left + 1
        best = left if left < @data.length && @cmp.call(@data[left], @data[best])
        best = right if right < @data.length && @cmp.call(@data[right], @data[best])
        break if best == i
        @data[i], @data[best] = @data[best], @data[i]
        i = best
      end
    end
    root
  end
end

class DualHeap
  def initialize(k)
    @small = Heap.new { |a, b| a > b }
    @large = Heap.new { |a, b| a < b }
    @delayed = Hash.new(0)
    @k = k
    @small_size = 0
    @large_size = 0
  end

  def prune_small
    while !@small.empty?
      num = @small.top
      break if @delayed[num] == 0
      @delayed[num] -= 1
      @delayed.delete(num) if @delayed[num] == 0
      @small.pop
    end
  end

  def prune_large
    while !@large.empty?
      num = @large.top
      break if @delayed[num] == 0
      @delayed[num] -= 1
      @delayed.delete(num) if @delayed[num] == 0
      @large.pop
    end
  end

  def make_balance
    if @small_size > @large_size + 1
      @large.push(@small.pop)
      @small_size -= 1
      @large_size += 1
      prune_small
    elsif @small_size < @large_size
      @small.push(@large.pop)
      @small_size += 1
      @large_size -= 1
      prune_large
    end
  end

  def insert(num)
    if @small.empty? || num <= @small.top
      @small.push(num)
      @small_size += 1
    else
      @large.push(num)
      @large_size += 1
    end
    make_balance
  end

  def erase(num)
    @delayed[num] += 1
    if num <= @small.top
      @small_size -= 1
      prune_small if num == @small.top
    else
      @large_size -= 1
      prune_large if !@large.empty? && num == @large.top
    end
    make_balance
  end

  def median
    return @small.top.to_f if @k.odd?
    (@small.top + @large.top) / 2.0
  end
end

def median_sliding_window(nums, k)
  dh = DualHeap.new(k)
  k.times { |i| dh.insert(nums[i]) }
  ans = [dh.median]
  (k...nums.length).each do |i|
    dh.insert(nums[i])
    dh.erase(nums[i - k])
    ans << dh.median
  end
  ans
end
