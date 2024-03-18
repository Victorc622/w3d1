class Array
  def my_each(&prc)
    index = 0
    while index < self.length
        prc.call(self[index])
        index += 1
    end
    self
  end

  def my_select(&prc)
    selected = []
    self.my_each do |ele|
      selected << ele if prc.call(ele)
    end
    selected
   end
end
