function init()
	script.setUpdateDelta(15)
end

function update(dt)
<<<<<<< HEAD
	scan = world.entityQuery(mcontroller.position(), effect.configParameter("scanRange"))
=======
	scan = world.entityQuery(mcontroller.position(), entity.configParameter("scanRange"))
>>>>>>> origin/master
	for i, entityId in pairs(scan) do
		scanResult = entityId
		if world.entityType(scanResult) == "monster" or world.farmableStage(scanResult) ~= nil or world.containerSize(scanResult) ~= nil then
			local positions = world.entityPosition(scanResult)
			world.spawnProjectile("invisibleprojectile-scan", {positions[1], positions[2] + 2.5}, entity.id(), {0, 0})
		scanResult = nil
		end
	end
end