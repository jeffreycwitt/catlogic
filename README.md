# Catlogic

This a library designed to construct, calculate, and investigate categorical propositions and syllogisms.

## Installation

While such a library may at first be intimidating for the novice to use, it is not beyond you. 

If you are using a Unix system (a Mac or Linux machine) you should be able to use this library quite easily with IRB, requiring little set up or programming knowledge.

To install `catlogic` run in your terminal

    gem install catlogic
    
To use in a script, simply require catlogic at the top of your file

	require 'catlogic'
	
To use in `irb`, (the recommended way for a beginner to play around with the library), enter the irb shell by typing in the terminal: 

	irb

Now type at the prompt
	
	> require 'catlogic'

You are now ready to go. To quickly create a syllogism type:

	syl = Catlogic::Form.new("AAA", 1).syllogism
	
Now you can test your syllogisms validity:

	syl.validity
	
Or generate a human readable output

	syl.label
	
See below for a detailed discussion of the kinds of objects you can create.
	
## Usage

To use the library, some knowledge of categorical logic, propositions, and syllogisms.

I recommend taking a look at the relevant wikipedia pages: [http://en.wikipedia.org/wiki/Syllogism](http://en.wikipedia.org/wiki/Syllogism); [http://en.wikipedia.org/wiki/Syllogism](http://en.wikipedia.org/wiki/Syllogism), [http://en.wikipedia.org/wiki/Categorical_proposition](http://en.wikipedia.org/wiki/Categorical_proposition); [http://www.logicmuseum.com/wiki/Syllogism](http://www.logicmuseum.com/wiki/Syllogism); [http://en.wikipedia.org/wiki/Square_of_opposition](http://en.wikipedia.org/wiki/Square_of_opposition)

Here I will just define the basic terms of categorical logic required to understand and use `catlogic` library.

### The Proposition
Perhaps the most important unit of categorical logic is the categorical proposition.

Thus one of the central objects in this library is the Propositions object. A Propositions is not, however, the smallest conceptual unit, but is in fact constructed from five other pieces of information: quantity, subject term, quality, predicate term, and a truth value. A Propositions objects is therefore constructed from four elemental level objects and one boolean, like so: 

    proposition = Catlogic::Proposition.new(
   		Catlogic::Quantity.new("universal"), 
   		Catlogic::Term.new("Dogs"), 
   		Catlogic::Quality.new("affirmative"), 
   		Catlogic::Term.new("Mammals"), 
   		true)
   		
Or this can be constructed in shorthand like so:

    proposition = Catlogic::Proposition.new("universal", "Dogs", "affirmative", "Mammals", true)
    
In either case, this construction corresponds to the human readable proposition "All Dogs are Mammals," which is can be retrieved using the label method:

    proposition.label
    
will produce

    "All Dogs are Mammals"
    
Besides the subject and predicate term and truth value, every categorical proposition has a quantity, either "universal" (All) or "particular" (Some). And every proposition has a quality, either "affirmative" (are) or "negative" (are not). 

The combination of Quality and Quantity data yields one of four unique proposition type, represented by A, E, I, and O, which can be retrieved from any constructed proposition like so: 

    proposition.type
    
But likewise, it is also possible to construct a generic propositions starting from a given proposition type. This can be constructed as follows:

    propositiontype = Catlogic::PropositionType.new("A")
    
A generic proposition can be constructed from this by using the `proposition` method: 

    proposition = propositiontype.proposition
    
Calling the `proposition.label` method now returns `All S are P`.

A number of immediate inferences can be made from a give proposition. These can be called as follows:

	proposition.contradictory	
	proposition.contrary
	proposition.subcontrary
	proposition.subaltern
	proposition.converse
	proposition.obverse
	proposition.contrapolated


### The Syllogism

The next major unit is the Syllogism, which is itself and object constructed from three Proposition Objects, a major proposition, a minor proposition, and the conclusion.

It is constructed first by creating three propositions.

    major = Catlogic:Proposition.new("universal", "Dogs", "affirmative", "Mammals")
    
	minor = Catlogic::Proposition.new("universal", "Cockapoos", "affirmative", "Dogs")
	
	conclusion = Catlogic::Proposition.new("universal", "Cockapoos", "affirmative", "Mammals")

Note that I left off adding `true` at the end of these proposition constructions because, if not stated, the Proposition object defaults to true.

The syllogism is then constructed from these propositions

    syllogism = Catlogic::Syllogism.new(major, minor, conclusion)
    
All of the different Proposition objects that make up the syllogism can be retrieved as follows:

	syllogism.major
	syllogism.minor
	syllogism.conclusion
	
Each syllogism has a middle term. This middle term is the term repeated in the major and minor premises. It can be retrieved from a syllogism as follows.

    syllogism.middle
    
This will return a term object and, to get the human readable version of that term, simply ask for the label.

   syllogism.middle.label
   
Which in our case, is "Dogs". 

Likewise each syllogism has a major term and a minor term. 

The minor term is found in the subject position in the conclusion premise and the major term is found in the predicate position in the conclusion premise. The Term objects can be retrieved as follows:

	syllogism.majorterm
	syllogism.minorterm
	
A syllogism also a unique Form is made up from a Mood and Figure. Each of these are objects that can be retrieved from a syllogism. The Mood is constituted by the three proposition types of the syllogisms three propositions. 

	syllogism.mood

returns a Mood objects, itself constructed from three PropositionType objects. A human readable output can be retrieved by applying the method `.label` to the Mood object, like so:

	syllogism.mood.label
	
This will return "AAA" because our syllogism is made up of three A proposition types. 

The form is also constructed from a figure, which is determined by the position of the middle term in the major and minor premises. There are four possible figures, and a Figure object can be retrieved by applying the figure method to the syllogism.

	syllogism.figure
	syllogism.figure.label
	
The addition of the `.label` method returns the integer 1 because our sample syllogism is a figure one.

Combining the Mood and the Figure objects constructs a Form object which can also be retrieved from a Syllogism object.

	syllogism.form
	syllogism.form.label # == "AAA1"
	
The Mood and Figure can also be retrieved directly from the Form of object

	form = syllogism.form
	form.mood
	form.figure
	
The Form object is also very useful because it allows us to very quickly construct a generic syllogism for any possible syllogism.

The Form object can be constructed as follows.

	form = Catlogic::Form.new("AAA", 1)
	
One can quickly create a syllogism from the given Form object by calling the syllogism method:

	syllogism = form.syllogism
	
Besides retrieving information about a given syllogism, we can also test a syllogisms validity: 

	syllogism.validity
	
If valid it will return `true`, if invalid it will return `false`. 

The validity method tests against six separate tests, that reduces to the 256 possible syllogisms to the 24 valid (unconditionally and conditionally) syllogisms. Each of these tests can be run separately.

	syllogism.undistributed_middle_test
	syllogism.illicit_major_test
	syllogism.illicit_minor_test
	syllogism.exclusive_premises_test
	syllogism.affirm_from_neg_test
	syllogism.neg_from_affirms_test
	
### Syllogism Pairs and Syllogism Collections	
This is a more advanced use case. But it may happen that you have two or more premises and you want to actually compute possible syllogisms that can be constructed from this set and then tested for validity.

To do this you can create a PremisePair Object from two Proposition objects

	preimsepair = Catlogic:PremisePari.new(major, minor)
	
On a PremisePair object you can request an array of possible conclusions. For any premise pair it will return the four possible conclusion combinations.

There are enough resources at this point in the library to allow you to test the validity of those possible conclusion and determine if you can infer any new truths from the original set of known propositions.

This can be written your self or done using the PremiseCollection object.

The PremiseCollection objects takes an array of Proposition objects in any order, constructed like so:

	collection = Catlogic::PremiseCollection.new([propostion1, proposition2, proposition3])
	
With this object constructed you can use the method `valid_syllogisms' to return an array of valid syllogisms that can be constructed from the input set.

	collection.valid_syllogims
	
You can also search for just new inferred conclusions either with `inferred_truths_unique` or `inferred_truths_new`.

	collection.inferred_truths_unique
	collection.inferred_truths_new

`inferred_truths_unique` will return on non duplicate truths inferred from the given set.

`inferred_truths_unique` will filter the above set excluding all inferred truths that were present in the original set.

  
    

