# author: Joseph Brick
# repository: https://github.com/josephxbrick/accordion

# create empty accordion
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
		backgroundColor: Utils.randomColor()
	# make expand/contract button as child of layer above
	expandButton = new Layer
		parent: layer
		name: "expand_button"
		size: 30
		x: 10
		backgroundColor: "#222222"
		blending: Blending.overlay
		y: Align.center
	# add layer to accordion: expandedHeight:200, contractedHeight:50, clickTarget:expandButton
	accordion.addItem layer, 200, 50, expandButton

# handle onExpand message
accordion.onExpand (layer, newHeight, oldHeight) ->
	print "#{layer.name} expanded; new height:#{newHeight}; old height:#{oldHeight}" 
# handle onContract message
accordion.onContract (layer, newHeight, oldHeight) ->
	print "#{layer.name} contracted; new height:#{newHeight}; old height:#{oldHeight}" 
