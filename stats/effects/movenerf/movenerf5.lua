function init()
  local bounds = mcontroller.boundBox()
end

function update(dt)
  mcontroller.controlModifiers({
      runModifier = -0.025,
	  jumpModifier = -0.05
    })
end

function uninit()
  
end