function init()
  local bounds = mcontroller.boundBox()
end

function update(dt)
  mcontroller.controlModifiers({
      runModifier = 0.25,
      jumpModifier = 0.1
    })
end

function uninit()
  
end