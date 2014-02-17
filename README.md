# Cdl

Parser Color Decision List ( ASC CDL ) files 

## Installation

Add this line to your application's Gemfile:

    gem 'cdl'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cdl

## Cdl::Edl Usage


	require "cdl"
	
	cdl = Cdl::Edl.new("cdl_file.edl")
	
	cdl.to_hash
	#=> [{:slope=>"1.2301 1.2175 1.2033", 
		  :offset=>"-0.0730 -0.0428 -0.0162", 
		  :power=>"1.0463 1.0538 1.0680", 
		  :sat=>"1.1002"}, ... ]
	
	
	cdl.slope
	#=> [{:red	 =>	 ["1.2301", "1.0246", "1.0246", "1.2998", ..., 
		  :green =>  ["1.2175", "1.0136", "1.0136", "1.3138", ..., 
		  :blue  =>  ["1.2033", "1.0008", "1.0008", "1.3165", ... }]

	cdl.offset
	#=> [{:red	 =>	 ["1.23...
	
	cdl.power
	#=> [{:red	 =>	 ["1.23...
	
	cdl.sat
	#=> ["1.2301", "1.0246", ...,


	
	
## TODO

* Add clip name and tape name
* Add XML module ( parse Cdl Xml files )

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
