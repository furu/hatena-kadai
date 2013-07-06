class Sorter
  def initialize
    @values = []
  end

  def get_values
    @values
  end

  def set_values(values)
    @values = values.clone
  end

  def sort
    sorted = []
    until @values.empty?
      sorted << @values.min
      @values.delete_at(@values.index(@values.min))
    end
    @values = sorted
  end
end
