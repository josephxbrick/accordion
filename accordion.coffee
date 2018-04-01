class exports.Accordion extends Layer
	constructor: (@o = {}) ->
		_.defaults @o,
			spacing: 2
			backgroundColor: ""
			animationOptions: time: 0.25, curve: Bezier.ease
			singleExpand: true
		super @o
		@expandedItem = undefined
		@previousExpandedItem = undefined

	expandItem: (layer, animateLayer = true) ->
		# emit the layer, its new height, and its previous height.
		@emit "expand", layer, layer.states.expanded.height, layer.height
		if animateLayer
			layer.animate "expanded"
		else
			layer.stateSwitch "expanded"
		if @o.singleExpand is true
			@previousExpandedItem = @expandedItem
			if @previousExpandedItem?
				@emit "contract", @previousExpandedItem, @previousExpandedItem.states.default.height, @previousExpandedItem.height
				if animateLayer
					@previousExpandedItem.animate "default"
				else
					@previousExpandedItem.stateSwitch "default"
			@expandedItem = layer
		@layoutItems(animateLayer)

	contractItem: (layer, animateLayer = true) ->
		# emit the layer, its new height, and its previous height.
		@emit("contract", layer, layer.states.default.height, layer.height)
		if animateLayer
			layer.animate "default"
		else
			layer.stateSwitch "default"
		if @o.singleExpand is true
			if @expandedItem is layer # deselecting selected item
				@previousExpandedItem = layer
				@expandedItem = undefined
		@layoutItems(animateLayer)

	addLayer: (layer, expandedHeight, normalHeight, clickTarget) ->
		if not normalHeight?
			normalHeight = layer.height
		if not clickTarget?
			clickTarget = layer
		verticalPageIndex = @children.length
		if verticalPageIndex is 0
			top = 0
		else
			top = _.last(@children).maxY + @o.spacing
		layer.props =
			width: @width
			height: normalHeight
			x: 0
			y: top
			parent: @
		layer.states =
			default:
				height: normalHeight
			expanded:
				height: expandedHeight
		layer.animationOptions = @animationOptions
		layer._verticalIndex = verticalPageIndex
		layer._originalY = layer.y
		@height = _.last(@children).maxY

		clickTarget.onClick ->
			layer = @
			if layer.parent is null
				throw new Error "The click target must be the child of an Accordion layer."

			while layer.parent.constructor.name isnt "Accordion"
				layer = layer.parent
				if layer.parent is null
					throw new Error "The click target must be the child of an Accordion layer."
			if layer.states.current.name is "default"
				layer.parent.expandItem layer
			else
				layer.parent.contractItem layer

	layoutItems: (animateLayer = true)->
		runningTop = 0
		for tile in @children
			if @o.singleExpand is true
				newY = tile._originalY
				# happens
				if not @expandedItem? # if current selection was deselected
					if tile._verticalIndex > @previousExpandedItem._verticalIndex
						newY = tile._originalY
				else
					if tile._verticalIndex > @expandedItem._verticalIndex
						delta = @expandedItem.states.expanded.height - @expandedItem.states.default.height
						newY = tile._originalY + delta
				if tile.y isnt newY
					if animateLayer
						tile.animate y: newY
					else
						tile.y = newY
			else
				if animateLayer
					tile.animate y: runningTop
				else
					tile.y = runningTop

			runningTop += tile.states[tile.states.current.name].height + @o.spacing
		if animateLayer
			@animate height: runningTop - @o.spacing
		else
			@height = runningTop - @o.spacing
