class Brew
  def initialize
    @consumed = false
  end
  def mark_consumed
    @consumed = true
  end
  def consumed?
    @consumed
  end
end