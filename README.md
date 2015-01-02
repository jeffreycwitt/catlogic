# Catlogic

## Installation

    gem install catlogic

## Usage

    require 'catlogic'

    # create a categorical proposition
    proposition = Proposition.new(Quantity.new("Universal"), Term.new("Dogs), Quality.new("Affirmative"), Term.new("Mortal"), true)
    
    # get the type of the proposition
    proposition.type
    
	#get a human readable form of the proposition
	propostion.label
	
	#make immediate inferences
	#obverse
	proposition.obverse
    
    # Build a proposition from its type
    proposition = PropositionType.new("I").proposition
    
	# Build a syllogism
	syllogism = Syllogism.new(majorproposition, minorproposition, conclusion)
    
    # Test the validity of a syllogism
    syllogism.validity
    
    # Get form of syllogism
    syllogism.form
    

