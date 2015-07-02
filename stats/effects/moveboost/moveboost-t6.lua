function init()
  local bounds = mcontroller.boundBox()
end

function update(dt)
  mcontroller.controlModifiers({
      runModifier = 1,
      jumpModifier = 0.5
    })
end

function uninit()
  
end