/*******************************************************************************
 * VortexFire generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2013 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class QuantumFire extends ProjectileFire;

simulated function DestroyEffects()
{
    super(WeaponFire).DestroyEffects();

    if((QuantumGun(Weapon) != none) && QuantumGun(Weapon).DummyProj != none)
    {
        QuantumGun(Weapon).DummyProj.Destroy();
    }

}

function InitEffects()
{
    if((Level.NetMode == NM_DedicatedServer) || AIController(Instigator.Controller) != none)
    {
        return;
    }

    super(WeaponFire).InitEffects();

    if(QuantumGun(Weapon).DummyProj == none)
    {
        QuantumGun(Weapon).DummyProj = Spawn(class'QuantumDummyProj');
    }
    Weapon.AttachToBone(QuantumGun(Weapon).DummyProj, 'tip');

}

function DrawMuzzleFlash(Canvas Canvas)
{
    if(FlashEmitter != none)
    {
        FlashEmitter.SetRotation(Weapon.Rotation);
    }
    super(WeaponFire).DrawMuzzleFlash(Canvas);
}

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
    local QuantumProj Quantum;
    local Vector X, Y, Z;
    local float pawnSpeed;

    Quantum = Spawn(class'QuantumProjBall', Instigator,, Start, Dir);

    if(Quantum != none)
    {
        Weapon.GetViewAxes(X, Y, Z);
        pawnSpeed = X Dot Instigator.Velocity;
        Quantum.Speed = pawnSpeed + Quantum.Speed;
        Quantum.Velocity = Quantum.Speed * vector(Dir);
    }
    return Quantum;
}

event ModeDoFire()
{
        super(WeaponFire).ModeDoFire();
}

function StopFiring()
{
    super(WeaponFire).StopFiring();
    Weapon.OutOfAmmo();
}

function PlayFiring()
{
    super(WeaponFire).PlayFiring();

    if(FireCount > 0)
    {
        QuantumGun(Weapon).HideDummyProj();
    }
}

defaultproperties
{
    ProjSpawnOffset=(X=20.0,Y=9.0,Z=-6.0)
    bTossed=true
    FireEndAnim=None
    FireSound=Sound'QuantumSounds.Vortex.Vortex_fire'
    FireForce="AssaultRifleAltFire"
    FireRate=1.50
    AmmoClass=class'QuantumAmmo'
    AmmoPerFire=1
    ShakeRotMag=(X=70.0,Y=0.0,Z=0.0)
    ShakeRotRate=(X=1000.0,Y=0.0,Z=0.0)
    ShakeRotTime=1.80
    ShakeOffsetMag=(X=0.0,Y=0.0,Z=-2.0)
    ShakeOffsetRate=(X=0.0,Y=0.0,Z=1000.0)
    ShakeOffsetTime=1.80
    ProjectileClass=class'QuantumProjBall'
    BotRefireRate=0.80
    FlashEmitterClass=Class'XEffects.BioMuzFlash1st'
    aimerror=100.0
}