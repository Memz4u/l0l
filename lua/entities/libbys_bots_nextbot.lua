-- "lua\\entities\\libbys_bots_nextbot.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
-- is bugs lua STFU DUMB ASS BITCH ASS FAGET





if SERVER then AddCSLuaFile() end

ENT.Base = "base_nextbot"
ENT.Type = "nextbot"


function ENT:ChasePos()
  if self.PosGen == nil then return end

  --if self.P == nil then 
    self.P = Path("Follow")
    self.P:SetMinLookAheadDistance(00)
    self.P:SetGoalTolerance(1000)
    self.P:Compute(self, self.PosGen)
  --end
  if !self.P:IsValid() then return end

  if self.P:GetAge() > 0.5 then
    self.P:Compute(self, self.PosGen)
  end
  if GetConVar("libbys_bot_nav_debug"):GetInt() == 1 then
    self.P:Draw()
  end
end

function ENT:RunBehaviour()
  while (true) do
    if self.PosGen then
      self:ChasePos()
    end
		
  coroutine.yield()
  end
end

function ENT:Initialize()
  self:SetModel("models/props_lab/huladoll.mdl")
  self:SetNoDraw(true)
  self:DrawShadow(false)
  self:SetSolid(SOLID_NONE)
  self:SetHealth(9999999)
  self.PosGen = nil
  -- motherfucker when i tell you to remove you actually fucking remove
  timer.Simple(60, function() self:Remove() end)
end


