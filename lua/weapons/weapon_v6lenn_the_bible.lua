-- "lua\\weapons\\weapon_v6lenn_the_bible.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.PrintName		= "The Bible"
SWEP.Author			= "credits too buddy148©, edited by lenn. Secretly suggested by Aquantic, credits too Ash for the filename,"
SWEP.Instructions 	= "Press left click to torture someone, Right click to throw books at them. R to show spirits."
SWEP.Purpose = "I don't even know what to say."
SWEP.Category = "Lenn's Weapons (RARE)"

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"




SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Slot				= 1
SWEP.SlotPos			= 2
SWEP.DrawAmmo			= false
SWEP.DrawCrosshair		= false
SWEP.UseHands			= true

SWEP.ViewModel			= "models/props_lab/bindergreen.mdl"
SWEP.WorldModel			= "models/props_lab/bindergreen.mdl"

local ShootSound1 = Sound( "vo/ravenholm/monk_rant01.wav" )
local ShootSound2 = Sound( "vo/ravenholm/shotgun_stirreduphell.wav" )
local ShootSound3 = Sound( "vo/ravenholm/monk_rant02.wav" )

local ReloadMusic = Sound( "vo/canals/gunboat_herelook.wav" )

function SWEP:PrimaryAttack()
	self.Weapon:SetNextPrimaryFire( CurTime() + 4.0 )	
	self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	self:ThrowMelon("models/props_junk/ravenholmsign.mdl",10000,"small")
                  self.Owner:SetHealth( 200 )
                  self.Owner:ConCommand("say  You sturred up hell! Hahahahahaha. Man after my own heart.")

	local eyetrace = self.Owner:GetEyeTrace() 
	self:ShootEffects() 
	if SERVER then
		local ent =  ents.Create ("env_explosion")
			ent:SetPos( eyetrace.HitPos ) 
			ent:SetOwner( self.Owner ) 
			ent:Spawn() 
			ent:SetKeyValue("iMagnitude","175") 
			ent:Fire("Explode", 0, 0 ) 
			ent:EmitSound("weapon_AWP.Single", 400, 400 ) 
	 

	end
end 


function SWEP:Reload()
	self:PlayerAct("agree")
end 

function SWEP:SecondaryAttack()
self.Weapon:SetNextSecondaryFire( CurTime() + 2 )	
local FireTimes = 1
self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
self.Owner:ConCommand("say  and if it would be snails are coming. but the life of light, mines, a greater stew.")
	for FireTimes=1,5 do
		self:ThrowMelon("models/props_lab/bindergreen.mdl",25000,"big")
	end
end

function SWEP:PlayerAct(act)
	if CLIENT or game.SinglePlayer() then
		self:EmitSound( ReloadMusic )
                                    self.Owner:ConCommand("say  Here, take a look at this.")
		self.Owner:ConCommand("act",act)
	end
end

    

function SWEP:ThrowMelon(model_file,set_velocity,melontype)

	if melontype == "big" then
		self:EmitSound( ShootSound1 )
	elseif melontype == "small" then
		self:EmitSound( ShootSound2 )
	else
		self:EmitSound( ShootSound3 )
	end

	if ( CLIENT ) then return end

	local ent = ents.Create( "prop_physics" )

	if (  !IsValid( ent ) ) then return end

	ent:SetModel( model_file )
 
	ent:SetPos( self.Owner:EyePos() + ( self.Owner:GetAimVector() * 16 ) )
	ent:SetAngles( self.Owner:EyeAngles() )
	ent:Spawn()

        -- (NEW STUFF IMPLEMENTED FOR THE V3.5 UPDATE)
        timer.Simple(/* "Timey", 10000, */1, function() ent:Remove() end )
 
	local phys = ent:GetPhysicsObject()
	if (  !IsValid( phys ) ) then ent:Remove() return end
 
	local velocity = self.Owner:GetAimVector()
	velocity = velocity * set_velocity
	velocity = velocity + ( VectorRand() * 10 ) -- a random element
	phys:ApplyForceCenter( velocity )
 
	cleanup.Add( self.Owner, "props", ent )
 
	undo.Create( "THE BIBLE CANNOT BE DELETED" )
		undo.AddEntity( ent )
		undo.SetPlayer( self.Owner )
	undo.Finish()
end


// New walk and runspeed for the v4 lenn update, makes it look like csgo again


-- default walkspeed / runspeed for gmod sandbox,
-- default walkspeed / runspeed for darkrp would be 150 walkspeed and 300 or 250 runspeed, who knows?
-- we need this kind of value for the deploy!!
SWEP.WalkSpeed = 150
SWEP.RunSpeed = 240

-- we need too change the walkspeed and runspeed when it's deployed. let us change it!
function SWEP:Deploy()
self.Owner:SetWalkSpeed( self.WalkSpeed )
self.Owner:SetRunSpeed( self.RunSpeed )
return true
end

-- we can't let the walkspeed and runspeed stay there when it's gone!
function SWEP:OnRemove()
self.Owner:SetWalkSpeed( "200" )
self.Owner:SetRunSpeed( "400" )
return true
end

-- we can't let the walkspeed and runspeed stay there when you change to a different weapon! (holster = putting gun away, but not removed)
function SWEP:Holster()
self.Owner:SetWalkSpeed( "200" )
self.Owner:SetRunSpeed( "400" )
return true
end




-- without return true, the speed will still stay the same even when you holster the weapon!!!

