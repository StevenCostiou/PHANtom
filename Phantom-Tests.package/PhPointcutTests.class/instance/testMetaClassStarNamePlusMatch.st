matching
testMetaClassStarNamePlusMatch
	| pc targetSet classCol regex |
	pc := PhPointcut new
		receivers: '*Morph class+';
		selectors: 'newBounds:'.
	regex := '\w*Morph class' asRegex.
	classCol := (SmalltalkImage current allClasses) collect: [:each | each class] thenSelect: [:each | regex matches: each name].
	targetSet := Set new.
	targetSet add: (Array with: (Morph class) with: #newBounds:).
	classCol do: [:each |
		(each allSelectors anySatisfy: [:s | s = #newBounds:]) ifTrue: [
			targetSet add: (Array with: each with: #newBounds:)]].
	classCol do: [:each | each allSubclasses do: [:s|
			(s allSelectors anySatisfy: [:sel | sel = #newBounds:]) ifTrue: [
				targetSet add: (Array with: s with: #newBounds:)]]].
	self assert: (pc getPointcuts = targetSet).
	