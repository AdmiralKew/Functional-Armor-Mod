function init()
  local maxShieldHealth = status.stat("maxHealth") * effect.configParameter("shieldHealthMultiplier")
  effect.addStatModifierGroup({{stat = "maxShield", amount = maxShieldHealth}})

  local initialPercentage = effect.configParameter("initialPercentage")
  status.modifyResource("shieldHealth", initialPercentage * maxShieldHealth)
  
  self.shieldHealthRegen = status.stat("maxShield") * effect.configParameter("shieldRegenPercentage")
  self.modifierGroup = effect.addStatModifierGroup({{stat = "shieldRegen", amount = self.shieldHealthRegen}})

  self.active = true
  self.expirationTimer = effect.configParameter("expirationTime") or 0

  addVisualEffect()
  
  animator.setParticleEmitterOffsetRegion("embers", mcontroller.boundBox())
end

function update(dt)
  if not status.resource("shieldHealth") == status.stat("maxShield") then
    if self.active then
      removeVisualEffect()
	end  
  if status.resource("shieldHealth") > status.stat("maxShield") then recharge()
    end

    if self.expirationTimer <= 0 then
      effect.expire()
    end
    self.expirationTimer = self.expirationTimer - dt

    self.active = false
  else
    if not self.active then
      addVisualEffect()
    end

    self.active = true
    self.expirationTimer = effect.configParameter("expirationTime") or 0
  end
end

function recharge()
    status.resource("shieldHealth") += status.stat("shieldHealthRegen")
	
	 if status.resource("shieldHealth") >= status.stat("maxShield") then
    animator.setParticleEmitterActive("embers", false)
  else
    animator.setParticleEmitterActive("embers", true)
  end
end

function selfDamage(notification)
  self.pauseTimer = effect.configParameter("pauseOnDamage", 0)
  if not status.resourcePositive("shieldHealth") then
    if self.expirationTimer > 0 then
      removeVisualEffect()
    else
      effect.expire()
    end
  end
end  

function addVisualEffect()
  if not effect.configParameter("hideBorder") then effect.setParentDirectives("border=3;00FFFF99;00000000") end
  animator.setAnimationState("shield", "on")
end

function removeVisualEffect()
  animator.setAnimationState("shield", "off")
  effect.setParentDirectives("")
end

function uninit()
  
end