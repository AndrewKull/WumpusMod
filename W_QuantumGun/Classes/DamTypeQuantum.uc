/*******************************************************************************
 * DamTypeVortex generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2013 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DamTypeQuantum extends WeaponDamageType
    abstract;

defaultproperties
{
    WeaponClass=class'QuantumGun'
    DeathString="%o got sucked up by %k's Singularity."
    FemaleSuicide="%o ran away too slow and got slurped by her own Singularity."
    MaleSuicide="%o ran away too slow and got slurped by his own Singularity."
    bCauseConvulsions=true
    bSuperWeapon=true
    bDelayedDamage=true
    VehicleDamageScaling=1.50
}