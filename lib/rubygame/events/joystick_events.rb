#--
#  This file is one part of:
#  Rubygame -- Ruby code and bindings to SDL to facilitate game creation
#
#  Copyright (C) 2008  John Croisant
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Lesser General Public
#  License as published by the Free Software Foundation; either
#  version 2.1 of the License, or (at your option) any later version.
#
#  This library is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  Lesser General Public License for more details.
#
#  You should have received a copy of the GNU Lesser General Public
#  License along with this library; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# ++


module Rubygame

  module Events


    # JoystickAxisMoved is an event that occurs when a
    # joystick's control stick has changed position on
    # one of its axes.
    # 
    # A joystick axis measures the movement of the control
    # stick. Most joysticks have at least 2 axes for each
    # stick, one for horizontal movement, and one for
    # vertical movement. Fancy ones have a third axis for
    # measuring twist, and controllers with two sticks have
    # at least 4 axes.
    # 
    # Unlike simple buttons or keys, which have only 2 values
    # (pressed or not-pressed), a joystick axis has a smooth
    # spectrum of possible values, ranging from -1.0 to 1.0.
    # This allows for smoother, more precise control than
    # is possible with the keyboard.
    # 
    class JoystickAxisMoved

      attr_reader :joystick_id
      attr_reader :axis
      attr_reader :value


      # Creates a new JoystickAxisMoved instance.
      # 
      # joystick_id::  an integer identifying which joystick
      #                changed. The first joystick is 0.
      # axis::         an integer identifying which axis changed.
      #                The first axis on each joystick is 0.
      # value::        a Float representing the current value
      #                of the axis. Ranges from -1.0 to 1.0.
      # 
      def initialize( joystick_id, axis, value )

        unless joystick_id.kind_of?(Fixnum) and joystick_id >= 0
          raise ArgumentError, "joystick_id must be an integer >= 0"
        end

        @joystick_id = joystick_id

        unless axis.kind_of?(Fixnum) and axis >= 0
          raise ArgumentError, "axis must be an integer >= 0"
        end

        @axis = axis

        unless value.kind_of?(Numeric) and value.between?(-1.0, 1.0)
          raise ArgumentError, "value must be a number in the range (-1.0)..(1.0)"
        end

        @value = value.to_f

     end

    end



    # JoystickBallMoved is an event that occurs when a
    # joystick's trackball has changed position.
    # 
    # A joystick trackball is a ball which rotates freely in
    # a socket, controlled by the user's fingers or thumb.
    # 
    # A trackball reports movement on x and y axes, measured
    # in pixels, just like a mouse does. However, a trackball
    # does not report its current position, only its movement
    # since the previous event.
    # 
    class JoystickBallMoved

      attr_reader :joystick_id
      attr_reader :ball
      attr_reader :rel


      # Creates a new JoystickBallMoved instance.
      # 
      # joystick_id::  an integer identifying which joystick
      #                changed. The first joystick is 0.
      # ball::         an integer identifying which ball changed.
      #                The first ball on each joystick is 0.
      # rel::          relative position (how much the ball moved
      #                since the previous event). [x,y], in pixels.
      # 
      def initialize( joystick_id, ball, rel )

        unless joystick_id.kind_of?(Fixnum) and joystick_id >= 0
          raise ArgumentError, "joystick_id must be an integer >= 0"
        end

        @joystick_id = joystick_id

        unless ball.kind_of?(Fixnum) and ball >= 0
          raise ArgumentError, "ball must be an integer >= 0"
        end

        @ball = ball

        @rel = rel.to_ary.dup
        @rel.freeze

        unless @rel.length == 2
          raise ArgumentError, "rel must have exactly 2 parts (got %s)"%@rel.length
        end

      end

    end



    class JoystickHatMoved

      attr_reader :joystick_id, :hat, :direction
      attr_reader :horizontal, :vertical

      @@valid_directions = [:up,   :up_right,  :right, :down_right, 
                            :down, :down_left, :left,  :up_left,
                            nil]

      def initialize( joystick_id, hat, direction )

        unless joystick_id.kind_of?(Fixnum) and joystick_id >= 0
          raise ArgumentError, "joystick_id must be an integer >= 0"
        end

        @joystick_id = joystick_id

        unless hat.kind_of?(Fixnum) and hat >= 0
          raise ArgumentError, "hat must be an integer >= 0"
        end

        @hat = hat

        unless @@valid_directions.include? direction
          raise ArgumentError, 
                "invalid direction '%s'. "%[direction.inspect] +\
                "Check the docs for valid directions."
        end

        @direction = direction

      end

    end

  end
end
