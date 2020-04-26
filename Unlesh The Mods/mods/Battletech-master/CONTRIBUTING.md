# Rules

* Keep it to lore, with exceptions. Many exceptions.
* Custom Vehicles/BA/'Mech designs can only be from MegaMekLab or from Sarna.net, or wherever you got them from.
* Tiles are considered 1.55 meters. Don't ask, it took a while. A long while.
* @Lord Rod, Lord of Rods [COM] for the vehicle speed rework, I approximated car width in meters as `0.4 * (tiles width) + 0.5<= 5`, or `2.5 + ( tiles - 5 ) * 0.15m` for larger vehicles.
* Damage is calculated using MegamekLab's damage values, times ~~`(40/.18)`~~ `(40 * (.18 * x))?`.
 ~~`x * (40/.18)`, with x being the damage value.~~ I got `40` from the damage of the revolver in CDDA. `.18` is the damage value of the revolver in Battletech. 
* `On a standard mapsheet the hex size as originally printed is approximately 1.25 inches and depicts terrain 30 meters (roughly 100 feet) across.` And since each tile is 1.55 meters, each hex is 19 tiles.
* Maybe infantry damage can be `x * 38.1428`, with x being the standard damage value. Make sure it isn't the armor piercing value, by the way.
* Example:
> RAC/2 has a range of 18. 
> 
> `19 * 18 = 342`
> 
> Thus the RAC/2 has a range of 342 tiles.
* "For infantry ranged, maybe they should be adjusted, like a lot?"
* You heard the man! 
* `Rodicus Coroticus the VIthToday at 6:58 PM
smh
I give up.
5x abstraction, here we go.`
* ~~`Dispersion is the weapon's BV divided by 1.55, with a limit of 200 for rifles and stuff like that, and shotguns having a limit of 500. Rockets have a limit of 150, with Artemis IV taking 100 off. Lasers have a max of 45. This is all arbituary, by the way.`~~
* Dispersion is based on type and range.
* Could always convert infantry damage to mech damage with 3:0.02.
* And with that, I can take the damage from the revolver in BT and base it from there?
* Bow density is `226.667 g/L`.
* Crossbow density is `1818.67 g/L`.
