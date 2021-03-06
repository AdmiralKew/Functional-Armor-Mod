function init()
	script.setUpdateDelta(15)
end

function update(dt)
	scan = world.entityQuery(mcontroller.position(), effect.configParameter("scanRange"))
	for i, entityId in pairs(scan) do
		scanResult = entityId
		if world.farmableStage(scanResult) ~= nil or world.containerSize(scanResult) ~= nil then
			local positions = world.entityPosition(scanResult)
			world.spawnProjectile("invisibleprojectile-scan", {positions[1], positions[2] + 2.5}, entity.id(), {0, 0})
		end
	end
end