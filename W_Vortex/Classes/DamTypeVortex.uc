/*******************************************************************************
 * DamTypeVortex generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2013 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DamTypeVortex extends WeaponDamageType
    abstract;

defaultproperties
{
    WeaponClass=class'Vortex'
    DeathString="%o got sucked up by %k's Vortex."
    FemaleSuicide="%o ran away too slow and got slurped by her own Vortex."
    MaleSuicide="%o ran away too slow and got slurped by his own Vortex."
    bCauseConvulsions=true
    bSuperWeapon=true
    bDelayedDamage=true
    VehicleDamageScaling=1.50
}