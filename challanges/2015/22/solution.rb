# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day22 < SolutionBase
    class Spell
      extend T::Sig

      sig { returns(Integer) }
      attr_accessor :timer

      sig { returns(T::Boolean) }
      attr_accessor :is_active

      def initialize
        @is_active = false
      end
    end

    class Enemy
      extend T::Sig
      sig { returns(Integer) }
      attr_accessor :hit_points

      sig { returns(Integer) }
      attr_accessor :damage

      def initialize(hit_points, damage)
        @hit_points = hit_points
        @damage = damage
      end
    end

    class Hero
      extend T::Sig
      sig { returns(Integer) }
      attr_accessor :hit_points

      sig { returns(Integer) }
      attr_accessor :mana

      sig { returns(Integer) }
      attr_accessor :armor

      def initialize(hit_points, mana)
        @hit_points = hit_points
        @mana = mana
        @armor = 0
      end
    end

    class State
      extend T::Sig

      sig { returns(Hero) }
      attr_reader :hero

      sig { returns(Enemy) }
      attr_reader :enemy

      sig { returns(T::Hash[String, Spell]) }
      attr_reader :spells

      sig { returns(Integer) }
      attr_accessor :mana

      attr_reader :logs

      sig { params(hero: Hero, enemy: Enemy, mana_spend: Integer, spells: T::Hash[String, Spell]).void }
      def initialize(hero, enemy, mana_spend, spells)
        @hero = hero
        @enemy = enemy
        @mana = mana_spend
        @spells = spells
        @logs = []
      end

      def do_effects
        @spells.each_key do |key|
          effect = T.must(@spells[key])
          next unless effect.is_active

          effect.timer -= 1

          case key
          when 'Poison'
            @enemy.hit_points -= 3
            @logs << "Poison timer: #{effect.timer}, enemy hp: #{@enemy.hit_points}"
          when 'Recharge'
            @hero.mana += 101
            @logs << "Recharge timer: #{effect.timer}, hero mana: #{@hero.mana}"
          end

          next unless effect.timer.zero?

          effect.is_active = false
          @hero.armor = 0 if key == 'Shield'
        end
      end

      def enemy_atack
        @hero.hit_points -= (@enemy.damage - @hero.armor)
        @logs << "Enemy attack #{@enemy.damage - @hero.armor}, current hero hp #{@hero.hit_points}"
      end

      def active_effects
        @spells.select { |_key, value| value.is_active == true }.keys
      end

      def hero_mana_ok
        return true if @hero.mana.positive?

        false
      end

      def enemy_dead
        return true if @enemy.hit_points <= 0

        false
      end

      def hero_dead
        return true if @hero.hit_points <= 0

        false
      end

      def cast(spell)
        case spell
        when 'Missle'
          @enemy.hit_points -= 4
          @hero.mana -= 53
          @logs << "enemy hp: #{@enemy.hit_points}"
        when 'Drain'
          @enemy.hit_points -= 2
          @hero.hit_points += 2
          @logs << "enemy hp: #{@enemy.hit_points}, hero hp: #{@hero.hit_points}"
          @hero.mana -= 73
        when 'Shield'
          effect = T.must(@spells['Shield'])
          effect.is_active = true
          effect.timer = 6
          @hero.armor = 7
          @hero.mana -= 113
        when 'Poison'
          effect = T.must(@spells['Poison'])
          effect.is_active = true
          effect.timer = 6
          @hero.mana -= 173
        when 'Recharge'
          effect = T.must(@spells['Recharge'])
          effect.is_active = true
          effect.timer = 5
          @hero.mana -= 229
        end

        @logs << "#{spell} cast, mana after cast: #{hero.mana}"
      end
    end

    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      all_spells = { 'Missle' => 53, 'Drain' => 73, 'Shield' => 113, 'Poison' => 173, 'Recharge' => 229 }

      hero = T.let(Hero.new(50, 500), Hero)
      enemy = Enemy.new(71, 10)
      all_effects = { 'Shield' => Spell.new,
                      'Poison' => Spell.new,
                      'Recharge' => Spell.new }

      states = T.let([State.new(hero, enemy, 0, all_effects)], T::Array[State])

      mana_lst = T.let(10_000, Integer)

      correct_state = T.let(nil, T.nilable(Year2015::Day22::State))

      loop do
        new_states = []
        states.each do |state|
          state.do_effects

          if state.enemy_dead
            mana_lst = state.mana if mana_lst > state.mana
            next
          end

          castable_spells = all_spells.keys - state.active_effects
          castable_spells.each do |spell|
            # hero turn
            new_state = T.cast(Marshal.load(Marshal.dump(state)), State)

            # part_two
            # new_state.hero.hit_points -= 1

            # next if new_state.hero_dead

            new_state.cast(spell)
            next unless new_state.hero_mana_ok

            new_state.mana += all_spells[spell]

            next if new_state.mana >= mana_lst

            # enemy turn
            new_state.do_effects
            if new_state.enemy_dead
              if mana_lst > new_state.mana
                mana_lst = new_state.mana
                correct_state = new_state
              end
              next
            end

            new_state.enemy_atack

            next if new_state.hero_dead

            new_states << new_state
          end
        end

        if new_states.empty?
          p T.must(correct_state).logs
          p mana_lst
          return
        end

        states = new_states
      end
    end

    def part_two
      raise NotImplementedError
    end
  end
end
