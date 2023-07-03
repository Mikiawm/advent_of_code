# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'

module Year2015
  class Day21 < SolutionBase
    class Item
      attr_accessor :name, :cost, :damage, :armor

      def initialize(name, cost, damage, armor)
        @name = name
        @cost = cost
        @damage = damage
        @armor = armor
      end
    end

    class Character
      attr_accessor :value, :damage, :armor, :hit_points

      def initialize(hit_points, damage, armor)
        @hit_points = hit_points
        @damage = damage
        @armor = armor
        @value = 0
      end

      def add_items(items)
        return if items.nil?

        items.each do |item|
          @damage += item.damage
          @armor += item.armor
          @value += item.cost
        end
      end

      def set(damage, armor, hit_points)
        @damage = damage
        @armor = armor
        @hit_points = hit_points
        @value = 0
      end

      def fight(enemy)
        loop do
          enemy.hit_points -= [@damage - enemy.armor, 1].max
          @hit_points -= [enemy.damage - @armor, 1].max
          return true if enemy.hit_points <= 0
          return false if @hit_points <= 0
        end
      end
    end

    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      # Weapons:    Cost  Damage  Armor
      # Dagger        8     4       0
      # Shortsword   10     5       0
      # Warhammer    25     6       0
      # Longsword    40     7       0
      # Greataxe     74     8       0
      weapons = [Item.new('Dagger', 8, 4, 0), Item.new('Shortsword', 10, 5, 0), Item.new('Warhammer', 25, 6, 0),
                 Item.new('Greataxe', 40, 7, 0), Item.new('Longsword', 74, 8, 0)]

      # Armor:      Cost  Damage  Armor
      # Leather      13     0       1
      # Chainmail    31     0       2
      # Splintmail   53     0       3
      # Bandedmail   75     0       4
      # Platemail   102     0       5
      armors = [Item.new('Leather', 13, 0, 1), Item.new('Chainmail', 31, 0, 2), Item.new('Splintmail', 53, 0, 3),
                Item.new('Bandemail', 75, 0, 4), Item.new('Platemail', 102, 0, 5)]

      armors_comb = armors.concat([[]])
      # Rings:      Cost  Damage  Armor
      # Damage +1    25     1       0
      # Damage +2    50     2       0
      # Damage +3   100     3       0
      # Defense +1   20     0       1
      # Defense +2   40     0       2
      # Defense +3   80     0       3
      rings = [Item.new('Damage +1', 25, 1, 0), Item.new('Damage +2', 50, 2, 0), Item.new('Damage +3', 100, 3, 0),
               Item.new('Defense +1', 20, 0, 1), Item.new('Defense +2', 40, 0, 2), Item.new('Defense +3', 80, 0, 3)]

      rings_combs = rings.combination(1).to_a + rings.combination(2).to_a + [[]]

      items_comb = []

      weapons.each do |weapon|
        armors.each do |armor|
          rings_combs.each do |rings|
            items_comb << [weapon, armor, rings].flatten.compact
          end
        end
      end

      costs = []
      items_comb.each do |items|
        enemy = Character.new(109, 8, 2)
        hero = Character.new(100, 0, 0)
        hero.add_items(items)

        costs << hero.value unless hero.fight(enemy)
      end

      p costs.max

      costs = []
      items_comb.each do |items|
        enemy = Character.new(109, 8, 2)
        hero = Character.new(100, 0, 0)
        hero.add_items(items)

        costs << hero.value if hero.fight(enemy)
      end

      p costs.min
    end

    def part_two
      raise NotImplementedError
    end
  end
end
