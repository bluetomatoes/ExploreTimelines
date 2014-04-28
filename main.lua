IosActivitySpinner=Core.class()

function IosActivitySpinner:init(labelText) 
	IosActivitySpinner.sharedInstance=self
	local loading=UIView:initWithFrame(CGRect(0, 0, 120, 120))
	loading:layer():setCornerRadius(15)
	loading:setOpaque(false)
	loading:setBackgroundColor(UIColor:colorWithWhite_alpha(0, 0.6))

	local label=UILabel:initWithFrame(CGRect(20, 20, 81, 22))
	label:setText(labelText)
	label:setFont(UIFont:boldSystemFontOfSize(14))
	label:setTextAlignment(UITextAlignmentCenter)
	label:setTextColor(UIColor:colorWithWhite_alpha(1, 0.8))
	label:setBackgroundColor(UIColor:clearColor())
	loading:addSubview(label)

	local spinning=UIActivityIndicatorView:initWithActivityIndicatorStyle(UIActivityIndicatorViewStyleWhiteLarge)
	spinning:setFrame(CGRect(42, 54, 37, 37))
	spinning:startAnimating()	
	loading:addSubview(spinning)

	getRootViewController():view():addSubview(loading)
	loading:setCenter(CGPoint(application:getContentWidth()/2, application:getContentHeight()/2))
	self.spinner=loading
end

function IosActivitySpinner.show(labelText) --` @public @function
	-- Show an activity spinner with the supplied label text and start it spinning.
	-- The spinner is a singleton instance of [IosActivitySpinner]. The animation is performed by
	-- iOS on a background thread so it doesn't matter if you subsequently block the UI thread; the spinner
	-- will continue to spin.
	--
	IosActivitySpinner.sharedInstance=IosActivitySpinner.new(labelText)
end

function IosActivitySpinner.hide() --` @public @function
	-- Stop any current instance of the [IosActivitySpinner] and remove it from the screen.
	IosActivitySpinner.sharedInstance.spinner:removeFromSuperview()
	IosActivitySpinner.sharedInstance=nil
end
