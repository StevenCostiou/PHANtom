baselines
setUpDependencies: spec
	spec
		configuration: 'PetitParser'
		with: [ spec versionString: #stable;
				loads: #('Core');
				repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ]
