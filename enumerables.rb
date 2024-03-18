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

  def my_flatten
    result = []
    self.each do |ele|
      if ele.is_a?(Array)
        result += ele.my_flatten
      else
        result << ele
      end
    end
   result
   end

   def my_zip(*args)
    result = []
    self.each_with_index do |ele, idx|
      temp = [ele]
      args.each do |arg|
        temp << (index < arg.length ? arg[index] : nil)
      end
      result << temp
    end
    result
   end
end
