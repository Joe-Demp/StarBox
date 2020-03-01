require_relative 'star_box.rb'

question = 'Question'

1.upto(5) do |x|
  box = StarBox.new(question + x.to_s)
  puts box.to_s
  puts
end
