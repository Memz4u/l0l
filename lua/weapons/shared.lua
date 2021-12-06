-- "lua\\weapons\\shared.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
-------------------------------------------------------------------
--Misc-------------------------------------------------------------
-------------------------------------------------------------------

SWEP.Gun					= ("bo3_xr2")
SWEP.Base				= "tfa_gun_base"
SWEP.Category				= "TFA BO3"
SWEP.Author				= "elwolf6"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.Manufacturer = "SATO"
SWEP.PrintName				= "XR-2"
SWEP.Slot				= 2
SWEP.SlotPos				= 30
SWEP.Type = "Assault Rifle"
SWEP.CSMuzzleFlashes = false
SWEP.CustomMuzzleFlash = true
SWEP.MuzzleFlashEffect = ("tfa_muzzleflash_incendiary")
SWEP.UseHands = false
SWEP.Tracer				= 0		--Bullet tracer.  TracerName overrides this.
SWEP.TracerName 		= "tfa_tracer_incendiary"

-------------------------------------------------------------------
--Sounds-----------------------------------------------------------
-------------------------------------------------------------------

SWEP.Primary.Sound			= Sound("weapons/xr2/aug-1.wav")  		-- Script that calls the primary fire sound
 
--SWEP.Primary.Sound			= Sound("weapons/r3k/shot10.wav")
--Sound("weapons/r3k/shot" .. math.random(1, 4) .. ".wav") 
-------------------------------------------------------------------
--Damage-----------------------------------------------------------
-------------------------------------------------------------------

SWEP.Primary.PenetrationMultiplier = 3
SWEP.Primary.Damage		= 50
SWEP.Primary.NumShots	= 1
SWEP.Primary.Automatic			= true
SWEP.SelectiveFire		= true
SWEP.DisableBurstFire	= false
SWEP.OnlyBurstFire		= false
SWEP.DefaultFireMode 	= ""
SWEP.Primary.ClipSize			= 30
SWEP.Primary.DefaultClip			= 150
SWEP.Primary.Ammo			= "ar2"
SWEP.DisableChambering = true
SWEP.Primary.RPM = 700

-------------------------------------------------------------------
--Accuracy And Recoil----------------------------------------------
-------------------------------------------------------------------

SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -3,
        Right = 0.5,
        Forward = 9.5,
        },
        Ang = {
        Up = 0,
        Right = 0,
        Forward = 180
        },
		Scale = 1.1
}

SWEP.Primary.KickUp			= 0.3
SWEP.Primary.KickDown			= 0.03
SWEP.Primary.KickHorizontal			= 0.3
SWEP.Primary.StaticRecoilFactor = 0.175
SWEP.Primary.Spread		= .02
SWEP.Primary.IronAccuracy = 0
SWEP.WeaponLength = 25
SWEP.MoveSpeed = 1

SWEP.BlowbackEnabled = true --Enable Blowback?
SWEP.BlowbackVector = Vector(0,-2,0) --Vector to move bone <or root> relative to bone <or view> orientation.
SWEP.BlowbackCurrentRoot = 0 --Amount of blowback currently, for root
SWEP.BlowbackCurrent = 0 --Amount of blowback currently, for bones
SWEP.Blowback_Only_Iron = true --Only do blowback on ironsights
SWEP.Blowback_PistolMode = false --Do we recover from blowback when empty?
SWEP.Blowback_Shell_Enabled = true
SWEP.Blowback_Shell_Effect = "RifleShellEject" 

-------------------------------------------------------------------
--Viewmodel--------------------------------------------------------
-------------------------------------------------------------------

SWEP.ViewModel				= "models/weapons/xr2/v_rif_aug.mdl"	-- Weapon view model
SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false

-------------------------------------------------------------------
--World Model------------------------------------------------------
-------------------------------------------------------------------

SWEP.WorldModel				= "models/weapons/xr2/w_rif_aug.mdl"	-- Weapon world model
SWEP.HoldType 				= "ar2"

-------------------------------------------------------------------
--Angle Things----------------------------------------------------
-------------------------------------------------------------------

SWEP.data 				= {}
SWEP.data.ironsights			= 1
SWEP.Secondary.IronFOV			= 70
SWEP.IronSightsPos = Vector(-3.701, -4.761, 0.469)
SWEP.IronSightsAng = Vector(0, -0.077, 0.6)
SWEP.SightsPos = Vector(-3.701, -4.761, 0.469)
SWEP.SightsAng = Vector(0, -0.077, 0.6)
SWEP.RunSightsPos = Vector(0.171, -0.144, 1.304)
SWEP.RunSightsAng = Vector(-12.351, 33.167, 0)
SWEP.InspectPos = Vector(4.159, -1.028, 2.809)
SWEP.InspectAng = Vector(2.226, 48.036, 16.281)

-------------------------------------------------------------------
--Shell and Muzzle-------------------------------------------------
-------------------------------------------------------------------

SWEP.MuzzleAttachment			= "1"
SWEP.ShellAttachment			= "0"
SWEP.LuaShellEject = false
SWEP.LuaShellEjectDelay = 0
SWEP.LuaShellEffect = nil


-- "lua\\weapons\\shared.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
-------------------------------------------------------------------
--Misc-------------------------------------------------------------
-------------------------------------------------------------------

SWEP.Gun					= ("bo3_xr2")
SWEP.Base				= "tfa_gun_base"
SWEP.Category				= "TFA BO3"
SWEP.Author				= "elwolf6"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.Manufacturer = "SATO"
SWEP.PrintName				= "XR-2"
SWEP.Slot				= 2
SWEP.SlotPos				= 30
SWEP.Type = "Assault Rifle"
SWEP.CSMuzzleFlashes = false
SWEP.CustomMuzzleFlash = true
SWEP.MuzzleFlashEffect = ("tfa_muzzleflash_incendiary")
SWEP.UseHands = false
SWEP.Tracer				= 0		--Bullet tracer.  TracerName overrides this.
SWEP.TracerName 		= "tfa_tracer_incendiary"

-------------------------------------------------------------------
--Sounds-----------------------------------------------------------
-------------------------------------------------------------------

SWEP.Primary.Sound			= Sound("weapons/xr2/aug-1.wav")  		-- Script that calls the primary fire sound
 
--SWEP.Primary.Sound			= Sound("weapons/r3k/shot10.wav")
--Sound("weapons/r3k/shot" .. math.random(1, 4) .. ".wav") 
-------------------------------------------------------------------
--Damage-----------------------------------------------------------
-------------------------------------------------------------------

SWEP.Primary.PenetrationMultiplier = 3
SWEP.Primary.Damage		= 50
SWEP.Primary.NumShots	= 1
SWEP.Primary.Automatic			= true
SWEP.SelectiveFire		= true
SWEP.DisableBurstFire	= false
SWEP.OnlyBurstFire		= false
SWEP.DefaultFireMode 	= ""
SWEP.Primary.ClipSize			= 30
SWEP.Primary.DefaultClip			= 150
SWEP.Primary.Ammo			= "ar2"
SWEP.DisableChambering = true
SWEP.Primary.RPM = 700

-------------------------------------------------------------------
--Accuracy And Recoil----------------------------------------------
-------------------------------------------------------------------

SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -3,
        Right = 0.5,
        Forward = 9.5,
        },
        Ang = {
        Up = 0,
        Right = 0,
        Forward = 180
        },
		Scale = 1.1
}

SWEP.Primary.KickUp			= 0.3
SWEP.Primary.KickDown			= 0.03
SWEP.Primary.KickHorizontal			= 0.3
SWEP.Primary.StaticRecoilFactor = 0.175
SWEP.Primary.Spread		= .02
SWEP.Primary.IronAccuracy = 0
SWEP.WeaponLength = 25
SWEP.MoveSpeed = 1

SWEP.BlowbackEnabled = true --Enable Blowback?
SWEP.BlowbackVector = Vector(0,-2,0) --Vector to move bone <or root> relative to bone <or view> orientation.
SWEP.BlowbackCurrentRoot = 0 --Amount of blowback currently, for root
SWEP.BlowbackCurrent = 0 --Amount of blowback currently, for bones
SWEP.Blowback_Only_Iron = true --Only do blowback on ironsights
SWEP.Blowback_PistolMode = false --Do we recover from blowback when empty?
SWEP.Blowback_Shell_Enabled = true
SWEP.Blowback_Shell_Effect = "RifleShellEject" 

-------------------------------------------------------------------
--Viewmodel--------------------------------------------------------
-------------------------------------------------------------------

SWEP.ViewModel				= "models/weapons/xr2/v_rif_aug.mdl"	-- Weapon view model
SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false

-------------------------------------------------------------------
--World Model------------------------------------------------------
-------------------------------------------------------------------

SWEP.WorldModel				= "models/weapons/xr2/w_rif_aug.mdl"	-- Weapon world model
SWEP.HoldType 				= "ar2"

-------------------------------------------------------------------
--Angle Things----------------------------------------------------
-------------------------------------------------------------------

SWEP.data 				= {}
SWEP.data.ironsights			= 1
SWEP.Secondary.IronFOV			= 70
SWEP.IronSightsPos = Vector(-3.701, -4.761, 0.469)
SWEP.IronSightsAng = Vector(0, -0.077, 0.6)
SWEP.SightsPos = Vector(-3.701, -4.761, 0.469)
SWEP.SightsAng = Vector(0, -0.077, 0.6)
SWEP.RunSightsPos = Vector(0.171, -0.144, 1.304)
SWEP.RunSightsAng = Vector(-12.351, 33.167, 0)
SWEP.InspectPos = Vector(4.159, -1.028, 2.809)
SWEP.InspectAng = Vector(2.226, 48.036, 16.281)

-------------------------------------------------------------------
--Shell and Muzzle-------------------------------------------------
-------------------------------------------------------------------

SWEP.MuzzleAttachment			= "1"
SWEP.ShellAttachment			= "0"
SWEP.LuaShellEject = false
SWEP.LuaShellEjectDelay = 0
SWEP.LuaShellEffect = nil


