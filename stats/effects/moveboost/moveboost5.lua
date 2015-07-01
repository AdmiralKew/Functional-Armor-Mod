function init()
  local bounds = mcontroller.boundBox()
end

function update(dt)
  mcontroller.controlModifiers({
      runModifier = 0.1,
      jumpModifier = 0.1
    })
end

function uninit()
  
end