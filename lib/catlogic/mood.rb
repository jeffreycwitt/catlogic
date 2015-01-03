class Mood
  attr_reader :majortype, :minortype, :conclusiontype

  # takes three propositionType objects
  def initialize(majortype, minortype, conclusiontype)
    @majortype = majortype
    @minortype = minortype
    @conclusiontype = conclusiontype
  end

  def label
    "#{@majortype.label}#{@minortype.label}#{@conclusiontype.label}"
  end
end
