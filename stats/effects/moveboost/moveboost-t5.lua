function init()
  local bounds = mcontroller.boundBox()
end

function update(dt)
  mcontroller.controlModifiers({
      runModifier = 0.75,
      jumpModifier = 0.25
    })
end

function uninit()
  
end