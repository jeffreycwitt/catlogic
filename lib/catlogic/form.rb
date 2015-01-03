module Catlogic
  class Form
    attr_reader :mood, :figure, :label
    # takes three Mood Object and Figure Object
    def initialize(mood, figure)
      @mood = mood.to_mood
      @figure = figure.to_figure
      @label = "#{@mood.label}#{@figure.label}"
    end
    def syllogism
       majorproposition = Proposition.new(@mood.majortype.quantity, @figure.major_subject, @mood.majortype.quality, @figure.major_predicate, true)
      minorproposition = Proposition.new(@mood.minortype.quantity, @figure.minor_subject, @mood.minortype.quality, @figure.minor_predicate, true)
      conclusion = Proposition.new(@mood.conclusiontype.quantity, Term.new("S"), @mood.conclusiontype.quality, Term.new("P"), true)

      syllogism = Syllogism.new(majorproposition, minorproposition, conclusion)

      return syllogism
    end
    def validity
      syllogism = self.syllogism
      syllogism.validity
    end
    def name
      case @figure.label
        when 1
          case @mood.label
            when "AAA"
              name = "Barbara"
            when "EAE"
              name = "Celarent"
            when "AII"
              name = "Darii"
            when "EIO"
              name = "Ferio"
            when "AAI"
              name = "Barbari"
            when "EAO"
              name = "Celaront"
            else
              name = nil
          end
        when 2
          case @mood.label
            when "EAE"
              name = "Cesare"
            when "AEE"
              name = "Camestres"
            when "EIO"
              name = "Festino"
            when "AOO"
              name = "Baroco"
            when "EAO"
              name = "Cesaro"
            when "AEO"
              name = "Camestrop"
            else
              name = nil
          end
        when 3
          case @mood.label
            when "AAI"
              name = "Darapti"
            when "IAI"
              name = "Disamis"
            when "AII"
              name = "Datisi"
            when "EAO"
              name = "Felapton"
            when "OAO"
              name = "Bocardo"
            when "EIO"
              name = "Ferison"
            else
              name = nil
          end
        when 4
          case @mood.label
            when "AAI"
              name = "Bramantip"
            when "AEE"
              name = "Camenes"
            when "IAI"
              name = "Festino"
            when "EAO"
              name = "Fesapo"
            when "EIO"
              name = "Fresison"
            when "AEO"
              name = "Camenop"
            else
              name = nil
          end
        else
          name = nil
      end
      return name
    end
  end
end
