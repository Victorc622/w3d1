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
   
  def my_reject(&prc)
    rejected = []
    self.my_each do |ele|
      rejected << ele unless prc.call(ele)
    end
    rejected
  end

  def my_any?(&prc)
    self.my_each do |ele|
      return true if prc.call(ele)
    end
    false
  end
  def my_all?(&prc)
    self.my_each do |ele|
      return false unless prc.call(ele)
    end
    true
  end
end
