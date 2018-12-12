module Pdf4me
  class Transform < Base
    ATTRIBUTES = {
      a: 'Integer',
      b: 'Integer',
      c: 'Integer',
      d: 'Integer',
      x: 'Integer',
      y: 'Integer'
    }
    attr_accessor *ATTRIBUTES.keys

    validates_presence_of :a, :b, :c, :d, :x, :y

  end
end