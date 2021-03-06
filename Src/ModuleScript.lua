local m = {}


	function m.gen(model, freq, pow, xres, zres, seed, gridSize)
		for x = 1, xres, model.PrimaryPart.Size.X do
	    	for z = 1, zres, model.PrimaryPart.Size.Z do
	       		local y1 = math.noise(
	           (x*freq)/xres,
	           (z*freq)/zres,
	           seed
	        	)*pow
	
				local y2 = math.noise(
	           (x*freq)/xres,
	           (z*freq)/zres,
	           seed
	        	)*pow
				
				local y = (y1+y2)/2

			
				local p = model:Clone()
				p.Parent = game.Workspace
				p:SetPrimaryPartCFrame(CFrame.new(x, y, z))
			end
		end
	end
	

	function m.bindTerr()
		for _, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "Cell" and v:IsA("Model") or v.Name == "guide" and v:IsA("Part") then
				if game.Workspace:FindFirstChild("PixelTerrain") == nil then
					m = Instance.new("Model", game.Workspace)
					m.Name = "PixelTerrain"
				end
				v.Parent = m
			end
		end
		game.Workspace:FindFirstChild("PixelTerrain").PrimaryPart = game.Workspace:FindFirstChild("PixelTerrain").guide
	end
	
	
	function m.makeCollide()
		for _, v in pairs(game.Workspace.PixelTerrain:GetChildren()) do
			if v:IsA("Model") then
				for _, k in pairs(v:GetChildren()) do
					if k:IsA("Part") then
						k.CanCollide = true
					end
				end
			end
		end
	end
	
return m
