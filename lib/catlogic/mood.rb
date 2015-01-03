module Catlogic
  class Mood
    attr_reader :majortype, :minortype, :conclusiontype

    # takes three propositionType objects
    def initialize(majortype, minortype, conclusiontype)
      @majortype = majortype.to_proposition_type
      @minortype = minortype.to_proposition_type
      @conclusiontype = conclusiontype.to_proposition_type
    end

    def to_mood
      self
    end

    def label
      "#{@majortype.label}#{@minortype.label}#{@conclusiontype.label}"
    end

    def to_s
      self.label
    end

  end
end

