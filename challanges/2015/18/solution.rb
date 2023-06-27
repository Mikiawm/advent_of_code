# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day18 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    class Grid
      attr_reader :rows, :columns

      def initialize(data)
        @rows = data.length - 1
        @columns = data.first.length - 1

        @grid = T.cast(data, T::Array[String]).map.with_index do |line, y|
          row = []
          line.each_char.with_index do |state, x|
            row << Light.new(x, y, state == '#')
          end
          row
        end
      end

      def [](x, y)
        return nil unless y.between?(0, @grid.length - 1)
        return nil unless x.between?(0, @grid[y].length - 1)

        @grid[y][x]
      end

      def size
        @grid.length
      end

      def each_row(&block)
        @grid.each(&block)
      end

      def each_cell
        each_row do |row|
          row.each do |cell|
            yield cell if cell
          end
        end
      end

      def neighbors_on_count(cell)
        sum = 0
        sum += 1 if self[cell.x - 1, cell.y]&.state
        sum += 1 if self[cell.x + 1, cell.y]&.state
        sum += 1 if self[cell.x, cell.y - 1]&.state
        sum += 1 if self[cell.x, cell.y + 1]&.state
        sum += 1 if self[cell.x - 1, cell.y - 1]&.state
        sum += 1 if self[cell.x - 1, cell.y + 1]&.state
        sum += 1 if self[cell.x + 1, cell.y - 1]&.state
        sum += 1 if self[cell.x + 1, cell.y + 1]&.state

        sum
      end

      def count
        sum = 0
        each_cell do |cell|
          sum += cell.state ? 1 : 0
        end

        sum
      end

      def to_s
        each_row do |row|
          row.each do |cell|
            print cell.state ? '#' : '.'
          end
          print "\n"
        end
      end

      def set_corner_cells
        self[0, 0].state = true
        self[0, @columns].state = true
        self[@rows, 0].state = true
        self[@rows, @columns].state = true
      end
    end

    class Light
      attr_accessor :x, :y, :state, :new_state

      def initialize(x, y, state)
        @x = x
        @y = y
        @state = state
      end
    end

    def part_one
      grid = Grid.new(data)

      100.times do |_|
        grid.each_cell do |cell|
          count = grid.neighbors_on_count(cell)
          cell.new_state =
            if cell.state
              true if [2, 3].include?(count)
            elsif !cell.state
              true if count == 3
            else
              false
            end
        end

        grid.each_cell do |cell|
          cell.state = cell.new_state
        end
      end

      grid.count
    end

    def part_two
      grid = Grid.new(data)

      grid.set_corner_cells

      100.times do |_|
        grid.each_cell do |cell|
          count = grid.neighbors_on_count(cell)

          cell.new_state =
            if cell.state
              true if [2, 3].include?(count)
            elsif !cell.state
              true if count == 3
            else
              false
            end
        end

        grid.each_cell do |cell|
          cell.state = cell.new_state
        end

        grid.set_corner_cells
      end

      grid.count
    end
  end
end
