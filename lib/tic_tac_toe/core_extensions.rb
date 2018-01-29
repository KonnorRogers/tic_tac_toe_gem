# NOT PART OF MODULE BECAUSE IT EXTENDS CORE RUBY

class Array
  def all_empty?
    self.all? { |element| element.to_s.empty? }
  end

  def all_same?
    self.all? { |element| element == self[0] }
  end

  def any_empty?
    return true if self.empty?
    self.any? { |element| element.to_s.empty? }
  end

  def none_empty?
    !self.any_empty?
  end
end