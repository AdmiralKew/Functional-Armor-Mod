function init()
	script.setUpdateDelta(15)
end

function update(dt)
	scan = world.entityQuery(mcontroller.position(), effect.configParameter("scanRange"))
	for i, entityId in pairs(scan) do
		scanResult = entityId
		if world.entityType(scanResult) == "monster" then
			local positions = world.entityPosition(scanResult)
			world.spawnProjectile("invisibleprojectile-monster", {positions[1], positions[2] + 2.5}, entity.id(), {0, 0})
		scanResult = nil
		end
	end
end