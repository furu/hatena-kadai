class Sorter
  attr_accessor :values

  def initialize
    @values = []
  end

  def sort!
    sorted = []
    until @values.empty?
      sorted << @values.min
      @values.delete_at(@values.index(@values.min))
    end
    @values = sorted
  end
end
