# author: Joseph Brick
# repository: https://github.com/josephxbrick/accordion

# create empty accordion that expands only one item at a time
accordion = new Accordion
	width: Screen.width - 20
	x: Align.center
	y: 10
	singleExpand: true
	
# Add 5 items to the accordion. Each item will have button inside to use as the expand/contract button
for i in [0...5]
	# make accordion item
	layer = new Layer
		name: "layer_#{i}"
		width: accordion.width
		height: 50
		backgroundColor: Utils.randomColor(0.67)
	# make expand/contract button as child of layer above
	expandButton = new Layer
		parent: layer
		name: "expand_button"
		size: 30
		x: 10
		backgroundColor: "#555555"
		blending: Blending.overlay
		opacity: 0.5
		y: Align.center
	# accordion.addItem(layerToAdd, expandedHeight, contractedHeight, clickTarget)
	accordion.addItem layer, Utils.randomNumber(120, 400), 50, expandButton
	
# handle onItemExpanded event
accordion.onItemExpanded (layer, newHeight, oldHeight) ->
	print "#{layer.name} expanded; new height:#{newHeight}; old height:#{oldHeight}" 
	
# handle onItemContracted event
accordion.onItemContracted (layer, newHeight, oldHeight) ->
	print "#{layer.name} contracted; new height:#{newHeight}; old height:#{oldHeight}" 
