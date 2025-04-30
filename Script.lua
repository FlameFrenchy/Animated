local Animate = {}

Animate.Create = function(name,Animation:Animation ,Animator :Animator)
	if not Animation.AnimationId:match("rbxassetid://") then
		return error("[AnimationError] The RbxAssetid was not added at the start of the ID of your animation, Consider adding 'rbxassetid://' before your ID.")
	end
	
	local AnimationTrack = Animator:LoadAnimation(Animation)
	
	local function attachEvent(event_name, func) 
		if not AnimationTrack[event_name] or typeof(AnimationTrack[event_name]) ~= "RBXScriptSignal" then
			warn("[AttachError] Failed to create attachedEvent due to 'event_name' not being apart as an param/setting of animation OR may not be a signal.")
			return nil, nil
		end
		print("Attached: ", event_name) 
		AnimationTrack[event_name]:Connect(func) 
	end
	AnimationTrack.Ended:Connect(function()
		AnimationTrack:Destroy()
	end)
	return AnimationTrack, attachEvent
end

return Animate
