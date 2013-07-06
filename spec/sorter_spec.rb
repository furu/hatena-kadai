require 'spec_helper'
require_relative '../sorter'

describe Sorter do
  let(:sorter) { Sorter.new }

  describe '#new' do
    subject { sorter }
    it { should be_instance_of(Sorter) }
  end

  describe '#values' do
    subject { sorter.values }

    it { should eq([]) }

    it do
      sorter.values = []
      should eq([])
    end

    it do
      sorter.values = [1]
      should eq([1])
    end

    it do
      sorter.values = [1, 2, 3, 4, 5]
      should eq([1, 2, 3, 4, 5])
    end
  end

  describe '#sort' do
    subject { sorter.values }

    it do
      sorter.sort
      should eq([])
    end

    it do
      sorter.values = [1]
      sorter.sort
      should eq([1])
    end

    it do
      sorter.values = [5, 4, 3, 2, 1]
      sorter.sort
      should eq([1, 2, 3, 4, 5])
    end

    it do
      sorter.values = [-1, -2, -3, -4, -5]
      sorter.sort
      should eq([-5, -4, -3, -2, -1])
    end

    it do
      sorter.values = [1, 2, 3, 4, 5]
      sorter.sort
      should eq([1, 2, 3, 4, 5])
    end

    it do
      sorter.values = [5, 5, 4, 4, 4, 3, 2, 1]
      sorter.sort
      should eq([1, 2, 3, 4, 4, 4, 5, 5])
    end

    5.times do
      it do
        random_values = []
        100.times { random_values << ((rand * 100).to_i - 50) }
        sorter.values = random_values.dup
        sorter.sort
        should eq(random_values.sort)
      end
    end
  end
end
