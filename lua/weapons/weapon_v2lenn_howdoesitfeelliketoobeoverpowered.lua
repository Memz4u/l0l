-- "lua\\weapons\\weapon_v2lenn_howdoesitfeelliketoobeoverpowered.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
if( SERVER ) then
 
        AddCSLuaFile( "shared.lua" );
 
end
 
if( CLIENT ) then
 
        SWEP.PrintName = "The Energetic Vial";
        SWEP.Slot = 0;
        SWEP.SlotPos = 5;
        SWEP.DrawAmmo = true;
        SWEP.DrawCrosshair = false;
 
end
 
// Variables that are used on both client and server
 
SWEP.Author               = "Created By Lenn"
SWEP.Instructions       = "Press left click to heal your friends, Press right click to heal yourself,"
SWEP.Contact        = ""
SWEP.Purpose        = "nobody can kill you, incept for that admin weapon, +999999999 or 999 MILLION HEALTH AND DELAY IS 0.1 SECONDS"
SWEP.Category = "Lenn's Weapon's (Heal)"
 
SWEP.Spawnable      = true
SWEP.AdminSpawnable          = true
SWEP.AdminOnly = true

SWEP.Sound = Sound( "items/smallmedkit1.wav" );
 
SWEP.NextStrike = 0;
  
SWEP.ViewModel = "models/weapons/v_medkit.mdl" 
SWEP.WorldModel =  "models/weapons/w_medkit.mdl" 
 
SWEP.Primary.ClipSize      = -1                                   // Size of a clip
SWEP.Primary.DefaultClip        = -1                    // Default number of bullets in a clip
SWEP.Primary.Automatic    = false            // Automatic/Semi Auto
SWEP.Primary.Ammo                     = ""
 
SWEP.Secondary.ClipSize  = -1                    // Size of a clip
SWEP.Secondary.DefaultClip      = -1            // Default number of bullets in a clip
SWEP.Secondary.Automatic        = false   // Automatic/Semi Auto
SWEP.Secondary.Ammo               = ""
 
 
 
/*---------------------------------------------------------
   Name: SWEP:Initialize( )
   Desc: Called when the weapon is first loaded
---------------------------------------------------------*/
function SWEP:Initialize()
 
        if( SERVER ) then
        
                self:SetWeaponHoldType( "melee" );
        
        end
end


function SWEP:Initialize()
     self:SetColor(Color(42, 14, 18, 255)) -- Paints world model
end

 
/*---------------------------------------------------------
   Name: SWEP:PrimaryAttack( )
   Desc: +attack1 has been pressed
---------------------------------------------------------*/
  function SWEP:PrimaryAttack()
  
        if( CurTime() < self.NextStrike ) then return; end
 
        self.NextStrike = ( CurTime() + 0.1 );
        
        if( CLIENT ) then return; end
 
        local trace = self.Owner:GetEyeTrace();
 
        if( not trace.Entity:IsValid() ) then
               return;
        end
        
        if( self.Owner:EyePos():Distance( trace.Entity:GetPos() ) > 100 ) then
                return;
        end
        
        if( SERVER ) then 
        
                local hp = trace.Entity:Health();
                if( hp >= 999999999 ) then return; end
                if( hp <= 999999999 ) then hp = hp + 999999999 end
                
                self.Owner:EmitSound( self.Sound );
                self.Owner:ChatPrint("What are you, trying to make someone overpowered? You son of a bitch! You're going to kill the whole world since you did that!")

                trace.Entity:SetHealth( hp );
                
        end
 
 
  end
 
  /*---------------------------------------------------------
   Name: SWEP:SecondaryAttack( )
   Desc: +attack2 has been pressed
  ---------------------------------------------------------*/
  function SWEP:SecondaryAttack()
 
        if( CurTime() < self.NextStrike ) then return; end
 
        self.NextStrike = ( CurTime() + 0.1 );
        
        if( CLIENT ) then return; end
        
        if( SERVER ) then 
        
                local hpp = self.Owner:Health();
                if( hpp >= 999999999 ) then return; end
                if( hpp <= 999999999 ) then hpp = hpp + 999999999 end
                
                self.Owner:EmitSound( self.Sound );
                self.Owner:ChatPrint("Ah. how does it feel that you only have overpower to yourself?")
                
                self.Owner:SetHealth( hpp );
                
        end
 
  end

