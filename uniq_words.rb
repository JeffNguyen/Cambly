def uniq_words(file)
  count = Hash.new(0)
  pairs = []

  File.foreach(file).each do |line|
    line.split(/\W+/).each do |word|
      count[word.downcase] += 1
    end
  end
  
  count.each do |word, count|
    pairs << [word, count]
  end

  # Sort based on count - if tied, resolve in alphabetical order
  pairs.sort! do |a, b|
    if b[1] == a[1]
      a[0] <=> b[0] 
    else
      b[1] <=> a[1]
    end
  end
  p pairs.length
  pairs
end

def print(arr)
  arr.each do |tuple|
    message = tuple[0].to_s + ' - ' + tuple[1].to_s + ' time(s)'
    puts message
  end
end

data = uniq_words('words.txt')
print(data)