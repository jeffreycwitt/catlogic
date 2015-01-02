class PremiseCollection
  def initialize(propositionarray)
    @collection = propositionarray
  end

  def getAllValidSyllogisms

    if @collection.count < 2
      puts "collection must include two or more propositions"
    else
      #inputconclusions = @collection
      validsyllogisms = []
      pairs = []

      @collection.each do |proposition|

        @collection.each do |secondproposition|
          unless proposition.equal? secondproposition
            pairs << PremisePair.new(proposition, secondproposition)
          end
        end
      end
      pairs.each do |pair|
        if pair.isThreeTermPair?
          conclusions = pair.getPossibleConclusions
          conclusions.each do |conclusion|
            syllogism = Syllogism.new(pair.getMajor, pair.getMinor, conclusion)
            if syllogism.validity == "valid"
              validsyllogisms << syllogism
            end
          end
        end
      end
    end
    return validsyllogisms
  end

  def getUniqueValidSyllogisms
      inputconclusions = @collection
      validsyllogisms = self.getAllValidSyllogisms
      uniquevalidsyllogisms = []

      validsyllogisms.each do |syllogism|
      validconclusion = syllogism.getConclusion
        if (validconclusion.isUnique?(inputconclusions))
                  uniquevalidsyllogisms << syllogism
        end
      end
    return uniquevalidsyllogisms
  end

=begin
  def getUniqueInferredTruths

    uniquevalidsyllogisms = self.getUniqueValidSyllogisms
    uniqueinferredtruths = []

    uniquevalidsyllogisms.each do |syllogism|
      uniqueinferredtruths << syllogism.getConclusion
    end

    return uniqueinferredtruths
  end
=end

  def getAllInferredTruths
    inputconclusions = @collection
    inferredconclusions = []

    validsyllogisms = self.getAllValidSyllogisms
    validsyllogisms.each do |syllogism|
      validconclusion = syllogism.getConclusion

      if (validconclusion.isUnique?(inputconclusions))
        inferredconclusions << validconclusion
      end
    end
    return inferredconclusions
  end


  def getUniqueInferredTruths
    newset = PremiseCollection.new(self.getAllInferredTruths)
    unique_inferredconclusions = newset.reduceToUniqueSet
    return unique_inferredconclusions
  end



  def displayLoopedInferredTruths

      #get first set of inferences from initial collection set
      inferredtruths = self.getUniqueInferredTruths
      #combine with existing - on first interation will be comined with empty array
      combinedset = self.combineSets(inferredtruths)

      puts "======================="
      puts "first set of inferences"
      puts inferredtruths.count
      puts "======================="


      self.displayAllValidSyllogisms
      self.displayUniqueSyllogisms
      self.displayInferredTruths


      while (inferredtruths.count != 0)

      ## create new collection object
      newcollection = PremiseCollection.new(combinedset)

      ## get next set of inferences

      #reset inferred truths
      inferredtruths = newcollection.getUniqueInferredTruths
      #rest combined set
      combinedset = newcollection.combineSets(inferredtruths)

      puts "======================="
      puts "next set of inferences"
      puts inferredtruths.count
      puts "======================="

      #display inferred set
      newcollection.displayAllValidSyllogisms
      newcollection.displayUniqueSyllogisms
      newcollection.displayInferredTruths

    end
  end


  def combineSets(newset)
    newcollection = []

    newcollection << @collection
    newcollection << newset


    return newcollection.flatten
  end



  def reduceToUniqueSet
    unique_knownconclusions = []

    @collection.each do |conclusion|
      if unique_knownconclusions.count == 0
        unique_knownconclusions << conclusion
      elsif conclusion.isUnique?(unique_knownconclusions)
        unique_knownconclusions << conclusion
      end


    end
    return unique_knownconclusions
end

  def displayInferredTruths
    truths = self.getUniqueInferredTruths
    puts 
    puts "==== Begin Display All Unique Inferred Truths ==="
    truths.each do |truth|
      truth.displayProposition
    end
    puts "==== End Display All Unique Inferred Truths ==="
    puts

  end

  def displayAllValidSyllogisms
    puts
    puts "====== Begin Display All Valid Syllogisms==="
    allvalidsyllogisms = self.getAllValidSyllogisms
    allvalidsyllogisms.each do |syllogism|
      syllogism.displayForm
      syllogism.displaySyllogism
      puts
    end
    puts "======End All Vallid Syllogisms==="
    puts
  end

  def displayUniqueSyllogisms

    puts
    puts "======Begin Display All Syllogism Producing new truths==="
    uniquevalidsyllogisms = self.getUniqueValidSyllogisms
    uniquevalidsyllogisms.each do |syllogism|
      syllogism.displayForm
      syllogism.displaySyllogism
      puts
    end
    puts "======End Display All Syllogism Producing new truths==="
    puts

  end


  def getNumberOfInferredTruths
    self.getUniqueInferredTruths.count
  end
  def getNumberOfInputTruths
    @collection.count
  end
  def getRatioInputToInferred
    self.getNumberOfInferredTruths / self.getNumberOfInputTruths
  end
end