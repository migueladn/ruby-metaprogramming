class Object
  def tab2(&block)
    self.instance_eval(&block)
    #block.call(self)
    self
  end

end

puts "========= Original ============"
(1..10)                .tap {|x| puts "original: #{x.inspect}"}         # original: 1..10
  .to_a                .tap {|x| puts "array: #{x.inspect}"}            # array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  .select {|x| x%2==0} .tap {|x| puts "evens: #{x.inspect}"}            # evens: [2, 4, 6, 8, 10]
  .map {|x| x*x}       .tap {|x| puts "squares: #{x.inspect}"}          # squares: [4, 16, 36, 64, 100]

puts "==========Custom ============="
(1..10)                .tab2 {|x| puts "original: #{x.inspect}"}         # original: 1..10
  .to_a                .tab2 {|x| puts "array: #{x.inspect}"}            # array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  .select {|x| x%2==0} .tab2 {|x| puts "evens: #{x.inspect}"}            # evens: [2, 4, 6, 8, 10]
  .map {|x| x*x}       .tab2 {|x| puts "squares: #{x.inspect}"}          # squares: [4, 16, 36, 64, 100]
