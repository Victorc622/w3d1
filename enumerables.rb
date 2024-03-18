class Array
  def my_each(&prc)
    index = 0
    while index < self.length
        prc.call(self[index])
        index += 1
    end
    self
  end
end