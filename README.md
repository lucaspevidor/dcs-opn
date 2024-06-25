# DCS Organic Panic (OPN) - Open Beta Stage

DCS Organic Panic (OPN) is a script developed by me for Digital Combat Simulator (DCS) that enhances the AI behavior of ground vehicles when under attack. By integrating this script into your DCS missions, you can expect a more dynamic and realistic response from AI-controlled ground units, making your simulation experience more immersive and challenging.

**[Download the script here <--](https://github.com/lucaspevidor/dcs-opn/releases)**

Remember to install [MIST](https://github.com/mrSkortch/MissionScriptingTools/releases) as well.

**[DCS Forum Topic](https://forum.dcs.world/topic/351172-dcs-organic-panic-opn-overhauling-ground-ai-behavior-while-under-attack/)**

**[Showcase Video](https://youtu.be/EvZo-HXIgRw)**

Author: Lucas Pevidor

## Contents

- [Features](#features)
- [Limitations](#limitations)
- [Example Missions](#example-missions)
- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [How to Use](#how-to-use)
- [To-Do List](#to-do-list)
- [Script Reference](#script-reference)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## Features

This script offers several key features that enhance the AI behavior of ground vehicles in DCS missions:

- Each ground unit stress level is tracked during the mission. Stress level decreases automatically over time, but can be increased by:
  - Being hit by a weapon.
  - Being close to a weapon impact.
  - Being close to a friendly unit being hit or destroyed.
  - Losing hitpoints
- The amount of stress added or removed depends on:
  - Unit type (tank, APC, IFV, light armored, air defense, cargo truck, transport truck or car)
  - Distance to the weapon impact.
  - Distance to the friendly unit being hit or destroyed.
  - Amount of damage received.
- When a unit's stress level starts to rise it will move and disperse. Each subsequent attacks near or on the unit will make it change position.
- If a unit's stress level rises and reaches a certain threshold, the following will happen:
  - The unit will panic and move away from the attack zone.
  - Then it will stop for a while, and then move to the vehicle fallback zone.
  - Once in the fallback zone, the unit will stop and wait for a while before returning to the attack zone. If it has less than 70% health, it will stay in the fallback zone. **IMPORTANT: At the present OPN version, units will not continue with their previous tasks after being attacked**.
  - If attacked again while in any of those states, the unit will always change positions, and may panic again.
- Ground unit crew is also simulated by the script:
  - If a unit loses over 70% of its health or catches on fire, it's considered disabled, so it won't move or attack anymore.
  - If a unit is disabled / on fire, the crew will dismount and later retreat to the infantry fallback zone.
  - Different types of units have different crew sizes, and the crew will be spawned as infantry units. There's a 7% (configurable) chance that a crew member will spawn as a MANPADS.
  - The amount of crew members spawned may vary between 0 and the max crew size of the unit. This is to simulate crew losses during the attack.
  - There's a 30% (configurable) chance that units placed in the Mission Editor will spawn without a crew (to simulated parked vehicles). However it's possible to force a unit to have no crew or max crew size, by changing the name of the group (described below).

## Limitations

- **Group Composition:** Each group must consist of only one unit to be compatible with OPN's control mechanisms.
- **Fallback Zones:** Limited to one fallback zone for vehicles and one for infantry, per coalition.
- **Waypoint Adherence:** Units will abandon mission editor-defined waypoints upon entering a panic or dispersed state and will not resume them.
- **Multiplayer Compatibility:** OPN should work in multiplayer missions, but it wasn't tested yet. It's possible that some features may not work as expected. Since controlled units won't return to their tasks after being attacked, the compatibility with other scripts might be affected.

## Example Missions

- **[OPN Example Mission - Syria](https://github.com/lucaspevidor/dcs-opn/releases/download/v0.84-beta/OPN-Example-0_84_Syria.miz):** A sample mission that demonstrates the capabilities of the OPN script. This mission is set in the Syria map and includes a variety of ground units that showcase the script's features. To use this mission, download the file and load it in the DCS Mission Editor.
- **[OPN Example Mission - Caucasus](https://github.com/lucaspevidor/dcs-opn/releases/download/v0.84-beta/OPN-Example-0_84_Caucasus.miz):** A sample mission that demonstrates the capabilities of the OPN script. This mission is set in the Caucasus map and includes a variety of ground units that showcase the script's features. To use this mission, download the file and load it in the DCS Mission Editor.

## Requirements

- **DCS World:** This script is designed to work within the Digital Combat Simulator environment.
- **DCS Mission Scripting Tool (MIST):** OPN requires MIST as a dependency to function correctly. Ensure that MIST is properly configured within your DCS mission. For more information, visit the [MIST GitHub repository](https://github.com/mrSkortch/MissionScriptingTools/releases).

## Installation

1. **Download OPN Script:** Download the latest version of the DCS Organic Panic script from the repository.
2. **Add MIST to your mission:** Ensure that the DCS Mission Scripting Tool (MIST) is configured in your DCS mission.
3. **Add OPN to your mission:** Include a trigger to load the OPN script in your mission at startup.

## Configuration

The first section of the script has the configuration options. You can change the values to fit your mission needs. There's also an Enum called opn.vehicleStats, which contains crew size and panic parameters for each vehicle type. These can also be changed to better balance / fit your mission.

## How to Use

### Loading the script in the Mission Editor

1. Create a new mission in the Mission Editor. Choose the map and country coalitions accordingly.
   - **IMPORTANT:** OPN crew is spawned as Combined Joint Task Force Red and Blue units. Make sure that CJTF Blue is in the blue coalition and CJTF Red is in the red coalition. Changing this will cause the crew to spawn as the wrong coalition and be attacked by their own side.
1. Go to the Triggers section, and create a new trigger. Set it to Once, and under Actions select "Do Script File" and choose the MIST script. It can be obtained from the [MIST GitHub repository](https://github.com/mrSkortch/MissionScriptingTools/releases).
1. Add a new action to the trigger, and select "Do Script" as the action again. Now choose the OPN script file.

[![MIST Script Setup](/assets/MISTSetup.png)](/assets/MISTSetup.png)
[![OPN Script Setup](/assets/OPNSetup.png)](/assets/OPNSetup.png)

### Setting up the units

1. Choose the place where units will spawn. Add a new group to the map.
   - **IMPORTANT:** Each group must consist of only one unit to be compatible with OPN's control mechanisms.
1. Set the unit type to the desired vehicle type.
   - **IMPORTANT:** Most, but not all vehicle types are compatible with the script. Most vehicles that are military and have wheels / tracks are compatible. There's a full list of compatible vehicles [**HERE**](#compatible-vehicles). It's also possible to check which vehicles are compatible by looking at the Enum opn.vehicleList in the script.
1. In order to set this unit to be controlled by the script you must change its group name to contain the following:
   - **-OPN:** This will make the script control the group, and there's a 30% chance the unit will spawn without a crew.
   - **-OPNE:** This will spawn the vehicle without a crew, so it won't move or attack.
   - **-OPNF:** This will force the unit to spawn with the maximum crew size.
   - Example: The first ground group you place will be named `Ground-1`. Change it to `Ground-1-OPN` to make it controlled by the script (**YOU MUST INCLUDE THE DASH BEFORE THE OPN TAG**) or `Ground-1-OPNE` to make it spawn without a crew, or `Ground-1-OPNF` to force it to spawn with the maximum crew size.
     - **Tip:** Name your groups with a number at the end, so it automatically increments the group name when you place / copy-paste a new one, like: `Ground-1-OPN-1`, `Ground-1-OPNF-1`.
1. Place or copy-paste more groups, to make the mission more interesting.
1. Add a new zone to the map, and set its radius. This will be the Vehicle Fallback Zone. To set it as the fallback zone, name it `Zone-VR` for the red coalition, or `Zone-VB` for the blue coalition.
   - If there are no ground units being controlled in the Blue coalition, you don't need to setup the blue zones, and vice-versa.
1. Now add another zone, and set it as the Infantry Fallback Zone. Name it `Zone-INFR` for the red coalition, or `Zone-INFB` for the blue coalition.
1. Now add your player group, and set the mission as you wish.

[![Unit Setup](/assets/UnitSetup.png)](/assets/UnitSetup.png)

### Running the mission

1. Save the mission, and run it in DCS.
1. When the mission starts, the script will be loaded and the units will be controlled by it. A message will be displayed in the top right corner of the screen, showing that the script was loaded.
   - **IMPORTANT:** The script is on a beta stage, and it's possible that some units may not behave as expected, or the script breaks completely. If you find any issues, please report them in the Issues section of the repository.

## To-Do List

- [ ] Add support for multiple fallback zones.
- [ ] Better balance the panic parameters based on unit types.
- [ ] Add stress resistance based on recently received stress.
- [ ] Add stress resistance based on the unit's health.
- [ ] Add stress resistance based on amount of alive units nearby.
- [ ] Different weapons have different effects on stress levels.
- [ ] Make units try to evade attacks by moving (e.g. evading mk82s)
- [ ] Create a logging system to track script issues.
- [ ] Improve script error handling.
- [ ] Add support for more vehicle types.
- [ ] Add different crew types for different vehicles.
- [ ] Add support for managing stress of infantry units.
- [ ] Add support for groups with multiple units - _I think this is the hardest one, so far..._.

## Script Reference

### Configurable Parameters

| Parameter Name                   | Description                                                                             | Default Value |
| -------------------------------- | --------------------------------------------------------------------------------------- | ------------- |
| opn.debugMessages                | Enable debug messages during DCS missions                                               | false         |
| opn.manpadsSpawnMessage          | Enable messages when MANPADS are dismounted                                             | false         |
| opn.controlGroupTag              | Group name tag to signal the script to control it                                       | "-OPN"        |
| opn.emptyControlGroupTag         | Group name tag to signal the script to control it without a crew                        | "-OPNE"       |
| opn.fullControlGroupTag          | Group name tag to force the script to control it with the maximum crew size             | "-OPNF"       |
| opn.vehicleEmptyChance           | Chance of a vehicle spawning without a crew                                             | 0.3           |
| opn.manpadsSpawnChance           | Chance of a crew member spawning as a MANPADS                                           | 0.07          |
| opn.vehicleDisabledLifePercent   | Life percent when a vehicle is considered disabled                                      | 0.3           |
| opn.vehicleWontReturnLifePercent | Life percent when a vehicle won't return to the attack area after panicking             | 0.7           |
| opn.minPanicTime                 | Minimum time a unit will panic after being attacked                                     | 45            |
| opn.maxPanicTime                 | Maximum time a unit will panic after being attacked                                     | 90            |
| opn.minKillPanicDistance         | Minimum distance for maximum panic effect when friendly units are killed                | 250           |
| opn.maxKillPanicDistance         | Maximum distance for minimum panic effect when friendly units are killed                | 600           |
| opn.panicIncreaseOnKill          | Amount of panic increased when a friendly unit is killed                                | 25            |
| opn.minWeaponCloseDistance       | Minimum distance for maximum panic effect on weapons hitting close to a unit's position | 50            |
| opn.maxWeaponCloseDistance       | Maximum distance for minimum panic effect on weapons hitting close to a unit's position | 300           |
| opn.panicIncreaseOnCloseWeapon   | Amount of panic increased when a weapon hits close to a unit's position                 | 40            |
| opn.panicIncreaseOnWeaponHit     | Amount of panic increased when a weapon hits a unit                                     | 30            |

### Compatible Vehicles

<details>
<summary>Click to expand</summary>
<br>

| Vehicle                  | Category       |
| ------------------------ | -------------- |
| ZTZ96B                   | TANK           |
| ZBD04A                   | TANK           |
| Pz_IV_H                  | TANK           |
| M4_Sherman               | TANK           |
| TYPE-59                  | TANK           |
| T-90                     | TANK           |
| T-80UD                   | TANK           |
| T-72B3                   | TANK           |
| T-72B                    | TANK           |
| T-55                     | TANK           |
| Merkava_Mk4              | TANK           |
| M-60                     | TANK           |
| M-1 Abrams               | TANK           |
| Leopard-2                | TANK           |
| Leopard-2A5              | TANK           |
| leopard-2A4_trs          | TANK           |
| leopard-2A4              | TANK           |
| Leclerc                  | TANK           |
| Chieftain_mk3            | TANK           |
| Challenger2              | TANK           |
| TPZ                      | APC            |
| Sd_Kfz_251               | APC            |
| MTLB                     | APC            |
| M2A1_halftrack           | APC            |
| M-113                    | APC            |
| BTR_D                    | APC            |
| BTR-80                   | APC            |
| AAV7                     | APC            |
| MCV-80                   | IFV            |
| Marder                   | IFV            |
| M-2 Bradley              | IFV            |
| M1126 Stryker ICV        | IFV            |
| LAV-25                   | IFV            |
| BTR-82A                  | IFV            |
| BMP-3                    | IFV            |
| BMP-2                    | IFV            |
| BMP-1                    | IFV            |
| BMD-1                    | IFV            |
| LARC-V                   | LIGHT_ARMORED  |
| tt_KORD                  | LIGHT_ARMORED  |
| tt_DSHK                  | LIGHT_ARMORED  |
| M1043 HMMWV Armament     | LIGHT_ARMORED  |
| HL_KORD                  | LIGHT_ARMORED  |
| HL_DSHK                  | LIGHT_ARMORED  |
| Cobra                    | LIGHT_ARMORED  |
| BRDM-2                   | LIGHT_ARMORED  |
| VAB_Mephisto             | LIGHT_ARMORED  |
| M1134 Stryker ATGM       | LIGHT_ARMORED  |
| M1045 HMMWV TOW          | LIGHT_ARMORED  |
| Ural-375 ZU-23           | AIR_DEFENSE    |
| Ural-375 ZU-23 Insurgent | AIR_DEFENSE    |
| ZSU_57_2                 | AIR_DEFENSE    |
| ZSU-23-4 Shilka          | AIR_DEFENSE    |
| Vulcan                   | AIR_DEFENSE    |
| tt_ZU-23                 | AIR_DEFENSE    |
| HL_ZU-23                 | AIR_DEFENSE    |
| Gepard                   | AIR_DEFENSE    |
| Strela-1 9P31            | AIR_DEFENSE    |
| Osa 9A33 ln              | AIR_DEFENSE    |
| 2S6 Tunguska             | AIR_DEFENSE    |
| Tor 9A331                | AIR_DEFENSE    |
| Strela-10M3              | AIR_DEFENSE    |
| Roland Radar             | AIR_DEFENSE    |
| Roland ADS               | AIR_DEFENSE    |
| M6 Linebacker            | AIR_DEFENSE    |
| M48 Chaparral            | AIR_DEFENSE    |
| M1097 Avenger            | AIR_DEFENSE    |
| Stinger comm dsr         | AIR_DEFENSE    |
| Stinger comm             | AIR_DEFENSE    |
| Soldier stinger          | AIR_DEFENSE    |
| SA-18 Igla-S comm        | AIR_DEFENSE    |
| SA-18 Igla-S manpad      | AIR_DEFENSE    |
| Igla manpad INS          | AIR_DEFENSE    |
| SA-18 Igla comm          | AIR_DEFENSE    |
| SA-18 Igla manpad        | AIR_DEFENSE    |
| HEMTT_C-RAM_Phalanx      | AIR_DEFENSE    |
| Ural-4320T               | TRUCK_PERSONAL |
| Ural-4320-31             | TRUCK_PERSONAL |
| Blitz_36-6700A           | TRUCK_PERSONAL |
| M 818                    | TRUCK_PERSONAL |
| Land_Rover_101_FC        | TRUCK_PERSONAL |
| KrAZ6322                 | TRUCK_PERSONAL |
| KAMAZ Truck              | TRUCK_PERSONAL |
| GAZ-66                   | TRUCK_PERSONAL |
| GAZ-3308                 | TRUCK_PERSONAL |
| Bedford_MWD              | TRUCK_PERSONAL |
| ZIL-135                  | TRUCK_CARGO    |
| ZIL-131 KUNG             | TRUCK_CARGO    |
| Ural-375 PBU             | TRUCK_CARGO    |
| Ural-375                 | TRUCK_CARGO    |
| SKP-11                   | TRUCK_CARGO    |
| KrAZ6322                 | TRUCK_CARGO    |
| S_75_ZIL                 | TRUCK_CARGO    |
| TZ-22_KrAZ               | TRUCK_CARGO    |
| M978 HEMTT Tanker        | TRUCK_CARGO    |
| ATZ-60_Maz               | TRUCK_CARGO    |
| ATZ-5                    | TRUCK_CARGO    |
| ATZ-10                   | TRUCK_CARGO    |
| ATMZ-5                   | TRUCK_CARGO    |
| r11_volvo_drivable       | TRUCK_CARGO    |
| ZiL-131 APA-80           | TRUCK_CARGO    |
| Ural-4320 APA-5D         | TRUCK_CARGO    |
| HEMTT TFFT               | TRUCK_CARGO    |
| P20_drivable             | CAR            |
| UAZ-469                  | CAR            |
| Tigr_233036              | CAR            |
| Land_Rover_109_S3        | CAR            |
| Hummer                   | CAR            |

</details>

## Contributing

Contributions to DCS Organic Panic are welcome. Whether it's reporting issues, suggesting features, or contributing to the code, your input helps improve OPN for everyone.

## License

DCS Organic Panic is released under a specific license. Please review the license terms before using or contributing to the project.

## Acknowledgments

A special thanks to the DCS community and the developers of the DCS Mission Scripting Tool (MIST) for their invaluable tools and support that make projects like OPN possible.
