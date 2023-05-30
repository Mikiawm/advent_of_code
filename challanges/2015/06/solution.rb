# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day06 < SolutionBase
    class LightGrid
      def initialize
        @arr = T.let([], T::Array[Light])
        1000.times do |x|
          1000.times do |y|
            @arr << Light.new(x, y)
          end
        end
      end

      def toggle(x_start, y_start, x_end, y_end)
        @arr.each do |light|
          light.state = light.state.zero? ? 1 : 0 if light_range_condition(light, x_start, y_start, x_end, y_end)
        end
      end

      def on(x_start, y_start, x_end, y_end)
        @arr.each do |light|
          light.state = 1 if light_range_condition(light, x_start, y_start, x_end, y_end)
        end
      end

      def off(x_start, y_start, x_end, y_end)
        @arr.each do |light|
          light.state = 0 if light_range_condition(light, x_start, y_start, x_end, y_end)
        end
      end

      def light_range_condition(light, x_start, y_start, x_end, y_end)
        light.x >= x_start && light.x <= x_end && light.y >= y_start && light.y <= y_end
      end

      def count
        @arr.reduce(0) { |sum, obj| sum + obj.state }
      end
    end

    class Light
      attr_accessor :x, :y, :state

      def initialize(x, y)
        @x = x
        @y = y
        @state = 0
      end
    end

    class BrightnessLightGrid < LightGrid
      def toggle(x_start, y_start, x_end, y_end)
        @arr.each do |light|
          light.state += 2 if light_range_condition(light, x_start, y_start, x_end, y_end)
        end
      end

      def on(x_start, y_start, x_end, y_end)
        @arr.each do |light|
          light.state += 1 if light_range_condition(light, x_start, y_start, x_end, y_end)
        end
      end

      def off(x_start, y_start, x_end, y_end)
        @arr.each do |light|
          light.state -= 1 if light_range_condition(light, x_start, y_start, x_end, y_end) && light.state.positive?
        end
      end
    end

    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      light_grid = LightGrid.new
      T.cast(data, T::Array[String]).each do |str|
        change_grid(light_grid, str)
      end

      light_grid.count
    end

    def part_two
      light_grid = BrightnessLightGrid.new
      T.cast(data, T::Array[String]).each do |str|
        change_grid(light_grid, str)
      end

      light_grid.count
    end

    def change_grid(light_grid, str)
      parts = str.split
      if parts[0] == 'toggle'
        x_start, y_start = get_range(parts[1])
        x_end, y_end = get_range(parts[3])
        light_grid.toggle(x_start, y_start, x_end, y_end)
      else
        x_start, y_start = get_range(parts[2])
        x_end, y_end = get_range(parts[4])
        light_grid.send(parts[1], x_start, y_start, x_end, y_end)
      end
    end

    def get_range(rang)
      T.cast(rang, String).split(',').map(&:to_i)
    end
  end
end
