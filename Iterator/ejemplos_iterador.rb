# Ejemplo de iteradores

a = [5, 1, 6, 7, 4]

# Ejemplo de iterador interno
a.each do |item|
  puts item
end

puts

# Ejemplo de yield de Ruby
def f_with_yield
  yield 5
  yield 20
end

f_with_yield {|x| puts x + 1}

puts

# Ejemplo de iterador interno
e = a.to_enum

e.each_with_index do |item, index|
  puts "[#{index}] #{item}"
end

puts

# Ejemplo de iterador externo
puts e.next
puts e.peek
puts e.next
puts e.next
e.rewind
puts e.next

puts

e.rewind

# begin
#   while true
#     puts e.next
#   end
# rescue StopIteration
#   puts 'End'
# end

loop do
  puts e.next
end

puts

# Ejemplo de generadores

e = Enumerator.new do |yielder|
  x = 5
  yielder << x
  x += 10
  yielder << x
  x *= 2
  yielder << x
end

loop do
  puts e.next
end

puts

# Ejemplo de generador que produce una secuencia
# potencialmente infinita de potencias de 2
e = Enumerator.new do |yielder|
  i = 1
  loop do
    yielder << i
    i *= 2
  end
end

1000.times do
  puts e.next
end
