::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                                                                  ::
:: = Configuration = :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                                                                  ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
setlocal
color 02
cls





::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                                                                  ::
:: = Variable declarations = :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                                                                  ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

set VAR_INPUT_FILES_DIRECTORY=%CD%\- SetupFiles -
set VAR_INPUT_PACKS_DIRECTORY=%CD%\- SetupPackages -

set VAR_SCREEN_HEAD_UPPERPART=%VAR_INPUT_FILES_DIRECTORY%\SCREEN_HEAD_UPPERPART
set VAR_SCREEN_HEAD_LOWERPART=%VAR_INPUT_FILES_DIRECTORY%\SCREEN_HEAD_LOWERPART

set VAR_OUTPUT_MAIN_DIRECTORY=%CD%\Overmap_Rebalancing

set VAR_CONFIGURATION_DIRECTORY=%VAR_OUTPUT_MAIN_DIRECTORY%\00_Configuration
set VAR_CONF_BS_AMBUSHED=%VAR_CONFIGURATION_DIRECTORY%\BS_AMBUSHED
set VAR_CONF_BS_BURNED=%VAR_CONFIGURATION_DIRECTORY%\BS_BURNED
set VAR_CONF_BS_EXPLODED=%VAR_CONFIGURATION_DIRECTORY%\BS_EXPLODED
set VAR_CONF_BS_LOOTED=%VAR_CONFIGURATION_DIRECTORY%\BS_LOOTED
set VAR_CONF_BS_SHELLED=%VAR_CONFIGURATION_DIRECTORY%\BS_SHELLED
set VAR_CONF_MOD_ADDBANDITS=%VAR_CONFIGURATION_DIRECTORY%\MOD_ADDBANDITS
set VAR_CONF_MOD_ANIMATRONICS=%VAR_CONFIGURATION_DIRECTORY%\MOD_ANIMATRONICS
set VAR_CONF_MOD_ARCANAMOD=%VAR_CONFIGURATION_DIRECTORY%\MOD_ARCANAMOD
set VAR_CONF_MOD_DINOMOD=%VAR_CONFIGURATION_DIRECTORY%\MOD_DINOMOD
set VAR_CONF_MOD_EXTENDEDBUILDINGS=%VAR_CONFIGURATION_DIRECTORY%\MOD_EXTENDEDBUILDINGS
set VAR_CONF_MOD_MININGMOD=%VAR_CONFIGURATION_DIRECTORY%\MOD_MININGMOD
set VAR_CONF_MOD_MORELOCATIONS=%VAR_CONFIGURATION_DIRECTORY%\MOD_MORELOCATIONS
set VAR_CONF_MOD_PARKSRECBUILDINGS=%VAR_CONFIGURATION_DIRECTORY%\MOD_PARKSRECBUILDINGS
set VAR_CONF_MOD_PKSREIMAGINING=%VAR_CONFIGURATION_DIRECTORY%\MOD_PKSREIMAGINING
set VAR_CONF_MOD_TALLBUILDINGS=%VAR_CONFIGURATION_DIRECTORY%\MOD_TALLBUILDINGS

set VAR_OUTPUT_CORE_DIRECTORY=%VAR_OUTPUT_MAIN_DIRECTORY%\01_CoreFiles
set VAR_OUTPUT_MODS_DIRECTORY=%VAR_OUTPUT_MAIN_DIRECTORY%\02_IncludedMods
set VAR_OUTPUT_BUSP_DIRECTORY=%VAR_OUTPUT_MAIN_DIRECTORY%\03_BuildingSpawns
set VAR_OUTPUT_RMBS_DIRECTORY=%VAR_OUTPUT_MAIN_DIRECTORY%\04_RebalancedModBuildingSpawns
set VAR_OUTPUT_COMP_DIRECTORY=%VAR_OUTPUT_MAIN_DIRECTORY%\05_CompatibilityFiles

set VAR_MOD_DESCRIPTION=%VAR_INPUT_FILES_DIRECTORY%\TEXT_MOD_DESCRIPTION

set VAR_CREDITS_ADDBANDITS=%VAR_INPUT_FILES_DIRECTORY%\CREDITS_MOD_ADDBANDITS
set VAR_CREDITS_ANIMATRONICS=%VAR_INPUT_FILES_DIRECTORY%\CREDITS_MOD_ANIMATRONICS
set VAR_CREDITS_DINOMOD=%VAR_INPUT_FILES_DIRECTORY%\CREDITS_MOD_DINOMOD
set VAR_CREDITS_EXTENDEDBUILDINGS=%VAR_INPUT_FILES_DIRECTORY%\CREDITS_MOD_EXTENDEDBUILDINGS
set VAR_CREDITS_PARKSRECBUILDPACK=%VAR_INPUT_FILES_DIRECTORY%\CREDITS_MOD_PARKSRECBUILDPACK

set VAR_FLOW_JUMPPOINT=JP_MainMenu
set VAR_FLOW_TEXT_INTRO=%VAR_INPUT_FILES_DIRECTORY%\TEXT_INTRO
set VAR_FLOW_TEXT_FILESCHECKED=%VAR_INPUT_FILES_DIRECTORY%\TEXT_FILESCHECKED
set VAR_FLOW_TEXT_DESCRIPTION=%VAR_INPUT_FILES_DIRECTORY%\TEXT_DESCRIPTION
set VAR_FLOW_TEXT_STEP_01=%VAR_INPUT_FILES_DIRECTORY%\TEXT_STEP_01
REM set VAR_FLOW_TEXT_STEP_02=%VAR_INPUT_FILES_DIRECTORY%\TEXT_STEP_02
set VAR_FLOW_TEXT_STEP_03=%VAR_INPUT_FILES_DIRECTORY%\TEXT_STEP_03
set VAR_FLOW_TEXT_STEP_04=%VAR_INPUT_FILES_DIRECTORY%\TEXT_STEP_04
REM set VAR_FLOW_TEXT_STEP_05=%VAR_INPUT_FILES_DIRECTORY%\TEXT_STEP_05
set VAR_FLOW_TEXT_STEP_06=%VAR_INPUT_FILES_DIRECTORY%\TEXT_STEP_06
set VAR_FLOW_TEXT_OUTRO=%VAR_INPUT_FILES_DIRECTORY%\TEXT_OUTRO
set VAR_FLOW_TEXT_ERROR_FILEMISSING=%VAR_INPUT_FILES_DIRECTORY%\ERROR_FILEMISSING

set VAR_MODPART_CORE=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_Core.zip
set VAR_MODPART_CORE_CONF_PLUSPK_PLUSSTREETS=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_Core_Conf_PlusPKPlusStreets.zip
set VAR_MODPART_CORE_CONF_PLUSPK_MINUSSTREETS=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_Core_Conf_PlusPKMinusStreets.zip
set VAR_MODPART_CORE_CONF_MINUSPK_PLUSSTREETS=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_Core_Conf_MinusPKPlusStreets.zip
set VAR_MODPART_MOD_ADDBANDITS=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_Mod_AddBandits.zip
set VAR_MODPART_MOD_ANIMATRONICS=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_Mod_Animatronics.zip
set VAR_MODPART_MOD_DINOMOD=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_Mod_DinoMod.zip
set VAR_MODPART_MOD_EXTENDEDBUILDINGS=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_Mod_ExtendedBuildings.zip
set VAR_MODPART_MOD_PARKSRECBUILDINGS=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_Mod_ParksAndRecreationBuildingsPack.zip
set VAR_MODPART_MODSUPPORT_ARCANAMOD=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_ModSupport_ArcanaMod.zip
set VAR_MODPART_MODSUPPORT_MORELOCATIONS=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_ModSupport_MoreLocations.zip
set VAR_MODPART_MODSUPPORT_TALLBUILDINGS=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_ModSupport_TallBuildings.zip
set VAR_MODPART_MODSUPPORT_MININGMOD=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_ModSupport_MiningMod.zip
set VAR_MODPART_BS_AMBUSHED_BASEGAME=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_BuildingSpawns_AmbushedBuildings_BaseGame.zip
set VAR_MODPART_BS_AMBUSHED_ADDBANDITS=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_BuildingSpawns_AmbushedBuildings_Mod_AddBandits.zip
set VAR_MODPART_BS_BURNED_BASEGAME=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_BuildingSpawns_BurnedBuildings_BaseGame.zip
set VAR_MODPART_BS_EXPLODED_BASEGAME=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_BuildingSpawns_ExplodedBuildings_BaseGameAndOMRB.zip
set VAR_MODPART_BS_EXPLODED_ANIMATRONICS=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_BuildingSpawns_ExplodedBuildings_Mod_Animatronics.zip
set VAR_MODPART_BS_EXPLODED_ARCANA=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_BuildingSpawns_ExplodedBuildings_Mod_Arcana.zip
set VAR_MODPART_BS_EXPLODED_DINOMOD=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_BuildingSpawns_ExplodedBuildings_Mod_DinoMod.zip
set VAR_MODPART_BS_EXPLODED_EXTENDEDBUILDINGS=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_BuildingSpawns_ExplodedBuildings_Mod_ExtendedBuildings.zip
set VAR_MODPART_BS_EXPLODED_PARKSRECBUILDINGS=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_BuildingSpawns_ExplodedBuildings_Mod_ParksAndRecreationBuildingsPack.zip
set VAR_MODPART_BS_LOOTED_BASEGAME=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_BuildingSpawns_LootedBuildings_BaseGame.zip
set VAR_MODPART_BS_SHELLED_BASEGAME=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_BuildingSpawns_ShelledBuildings_BaseGame.zip
set VAR_MODPART_COMP_ADD_DIN=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_Compatibility_Mods_AddDin.zip
set VAR_MODPART_COMP_ADD_DIN_PKS=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_Compatibility_Mods_AddDinPKs.zip
set VAR_MODPART_COMP_ADD_PKS=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_Compatibility_Mods_AddPKs.zip
set VAR_MODPART_COMP_DIN_PKS=%VAR_INPUT_PACKS_DIRECTORY%\OvermapRebalance_Compatibility_Mods_DinPKs.zip

set VAR_FLOW_USING_CORE_CONF_PLUSPK_PLUSSTREETS=%VAR_OUTPUT_COMP_DIRECTORY%\omrb_overmap_specials_PlusPKPlusStreets.json
set VAR_FLOW_USING_CORE_CONF_PLUSPK_MINUSSTREETS=%VAR_OUTPUT_COMP_DIRECTORY%\omrb_overmap_specials_PlusPKMinusStreets.json
set VAR_FLOW_USING_CORE_CONF_MINUSPK_PLUSSTREETS=%VAR_OUTPUT_COMP_DIRECTORY%\omrb_overmap_specials_MinusPKPlusStreets.json
set VAR_FLOW_USING_ARCANAMOD=%VAR_OUTPUT_RMBS_DIRECTORY%\overmap_specials_mod_arcana.json
set VAR_FLOW_USING_MORELOCATIONS=%VAR_OUTPUT_RMBS_DIRECTORY%\overmap_specials_mod_morelocations.json
set VAR_FLOW_USING_TALLBUILDINGS=%VAR_OUTPUT_RMBS_DIRECTORY%\overmap_specials_mod_zlevelbuildings.json
set VAR_FLOW_USING_MININGMOD=%VAR_OUTPUT_RMBS_DIRECTORY%\overmap_specials_mod_mining.json
set VAR_FLOW_USING_ADDBANDITS=%VAR_OUTPUT_MODS_DIRECTORY%\Included_Mod_AddBandits
set VAR_FLOW_USING_ANIMATRONICS=%VAR_OUTPUT_MODS_DIRECTORY%\Included_Mod_Animatronics
set VAR_FLOW_USING_DINOMOD=%VAR_OUTPUT_MODS_DIRECTORY%\Included_Mod_DinoMod
set VAR_FLOW_USING_EXTENDEDBUILDINGS=%VAR_OUTPUT_MODS_DIRECTORY%\Included_Mod_ExtendedBuildings
set VAR_FLOW_USING_PARKSRECBUILDINGS=%VAR_OUTPUT_MODS_DIRECTORY%\Included_Mod_ParksAndRecBuildingsPack
set VAR_FLOW_USING_AMBUSHED_BASEGAME=%VAR_OUTPUT_BUSP_DIRECTORY%\Additional_AmbushedBuildings_BaseGame
set VAR_FLOW_USING_AMBUSHED_ADDBANDITS=%VAR_OUTPUT_BUSP_DIRECTORY%\Additional_AmbushedBuildings_Mod_AddBandits
set VAR_FLOW_USING_BURNED_BASEGAME=%VAR_OUTPUT_BUSP_DIRECTORY%\Additional_BurnedBuildings_BaseGame
set VAR_FLOW_USING_EXPLODED_BASEGAME=%VAR_OUTPUT_BUSP_DIRECTORY%\Additional_ExplodedBuildings_BaseGame
set VAR_FLOW_USING_EXPLODED_OMRB=%VAR_OUTPUT_BUSP_DIRECTORY%\Additional_ExplodedBuildings_omrb
set VAR_FLOW_USING_EXPLODED_ANIMATRONICS=%VAR_OUTPUT_BUSP_DIRECTORY%\Additional_ExplodedBuildings_Mod_Animatronics
set VAR_FLOW_USING_EXPLODED_ARCANA=%VAR_OUTPUT_BUSP_DIRECTORY%\Additional_ExplodedBuildings_Mod_Arcana
set VAR_FLOW_USING_EXPLODED_DINOMOD=%VAR_OUTPUT_BUSP_DIRECTORY%\Additional_ExplodedBuildings_Mod_DinoMod
set VAR_FLOW_USING_EXPLODED_EXTENDEDBUILDINGS=%VAR_OUTPUT_BUSP_DIRECTORY%\Additional_ExplodedBuildings_Mod_ExtendedBuildings
set VAR_FLOW_USING_EXPLODED_PARKSRECBUILDINGS=%VAR_OUTPUT_BUSP_DIRECTORY%\Additional_ExplodedBuildings_Mod_ParksAndRecreationBuildingsPack
set VAR_FLOW_USING_LOOTED_BASEGAME=%VAR_OUTPUT_BUSP_DIRECTORY%\Additional_LootedBuildings_BaseGame
set VAR_FLOW_USING_SHELLED_BASEGAME=%VAR_OUTPUT_BUSP_DIRECTORY%\Additional_ShelledBuildings_BaseGame
set VAR_FLOW_USING_COMP_ADD_DIN=%VAR_OUTPUT_COMP_DIRECTORY%\omrb_monstergroups_mods_addbandits_dino.json
set VAR_FLOW_USING_COMP_ADD_DIN_PKS=%VAR_OUTPUT_COMP_DIRECTORY%\omrb_monstergroups_mods_addbandits_dino_pksreimagining.json
set VAR_FLOW_USING_COMP_ADD_PKS=%VAR_OUTPUT_COMP_DIRECTORY%\omrb_monstergroups_mods_addbandits_pksreimagining.json
set VAR_FLOW_USING_COMP_DIN_PKS=%VAR_OUTPUT_COMP_DIRECTORY%\omrb_monstergroups_mods_dino_pksreimagining.json





::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                                                                  ::
:: = Initialising script = :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                                                                  ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

if exist "%VAR_OUTPUT_MAIN_DIRECTORY%\" goto JP_MainMenu
more /c "%VAR_FLOW_TEXT_INTRO%" & pause
set VAR_FLOW_JUMPPOINT=JP_ReturnPoint_Initialisation
goto JP_CheckFiles

:JP_ReturnPoint_Initialisation
set VAR_FLOW_JUMPPOINT=JP_MainMenu
more /c "%VAR_FLOW_TEXT_FILESCHECKED%" & pause
goto JP_CoreFilesMenu





::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                                                                  ::
:: = Functions = :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                                                                  ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Check Files - Begin = ::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:JP_CheckFiles
if not exist "%VAR_FLOW_TEXT_INTRO%" goto JP_ErrorMissingFile
if not exist "%VAR_FLOW_TEXT_FILESCHECKED%" goto JP_ErrorMissingFile
if not exist "%VAR_FLOW_TEXT_DESCRIPTION%" goto JP_ErrorMissingFile
if not exist "%VAR_FLOW_TEXT_STEP_01%" goto JP_ErrorMissingFile
REM if not exist "%VAR_FLOW_TEXT_STEP_02%" goto JP_ErrorMissingFile
if not exist "%VAR_FLOW_TEXT_STEP_03%" goto JP_ErrorMissingFile
if not exist "%VAR_FLOW_TEXT_STEP_04%" goto JP_ErrorMissingFile
REM if not exist "%VAR_FLOW_TEXT_STEP_05%" goto JP_ErrorMissingFile
if not exist "%VAR_FLOW_TEXT_STEP_06%" goto JP_ErrorMissingFile
if not exist "%VAR_FLOW_TEXT_OUTRO%" goto JP_ErrorMissingFile
if not exist "%VAR_FLOW_TEXT_ERROR_FILEMISSING%" goto JP_ErrorMissingFile

if not exist "%VAR_SCREEN_HEAD_UPPERPART%" goto JP_ErrorMissingFile
if not exist "%VAR_SCREEN_HEAD_LOWERPART%" goto JP_ErrorMissingFile

if not exist "%VAR_MODPART_CORE%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_CORE_CONF_PLUSPK_PLUSSTREETS%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_CORE_CONF_PLUSPK_MINUSSTREETS%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_CORE_CONF_MINUSPK_PLUSSTREETS%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_MOD_ADDBANDITS%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_MOD_ANIMATRONICS%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_MOD_DINOMOD%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_MOD_EXTENDEDBUILDINGS%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_MOD_PARKSRECBUILDINGS%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_MODSUPPORT_ARCANAMOD%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_MODSUPPORT_MORELOCATIONS%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_MODSUPPORT_TALLBUILDINGS%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_MODSUPPORT_MININGMOD%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_BS_AMBUSHED_ADDBANDITS%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_BS_AMBUSHED_BASEGAME%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_BS_BURNED_BASEGAME%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_BS_EXPLODED_BASEGAME%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_BS_EXPLODED_ANIMATRONICS%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_BS_EXPLODED_ARCANA%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_BS_EXPLODED_DINOMOD%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_BS_EXPLODED_EXTENDEDBUILDINGS%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_BS_EXPLODED_PARKSRECBUILDINGS%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_BS_LOOTED_BASEGAME%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_BS_SHELLED_BASEGAME%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_COMP_ADD_DIN%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_COMP_ADD_DIN_PKS%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_COMP_ADD_PKS%" goto JP_ErrorMissingFile
if not exist "%VAR_MODPART_COMP_DIN_PKS%" goto JP_ErrorMissingFile

goto %VAR_FLOW_JUMPPOINT%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Check Files - End = ::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Main Menu - Begin = ::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:JP_MainMenu
set VAR_FLOW_JUMPPOINT=JP_ReturnPoint_MainMenu
goto JP_CheckFiles
:JP_ReturnPoint_MainMenu
set VAR_FLOW_JUMPPOINT=JP_MainMenu
cls
                                                            type "%VAR_SCREEN_HEAD_UPPERPART%"
                                                            echo ==      // Main Menu                                                                                                 ==
                                                            type "%VAR_SCREEN_HEAD_LOWERPART%"
                                                            echo     [1] MORE INFORMATIONS
if not exist "%VAR_OUTPUT_MAIN_DIRECTORY%\"                 echo     [2] INSTALL CORE MOD FILES
if exist "%VAR_OUTPUT_MAIN_DIRECTORY%\"                     echo     [2] RESTORE CORE MOD FILES
if exist "%VAR_OUTPUT_MAIN_DIRECTORY%\"                     echo     [3] CONFIGURE CORE MOD FILES
if exist "%VAR_OUTPUT_MAIN_DIRECTORY%\"                     echo     [4] INSTALL ADDITIONAL MOD FILES
                                                            echo     [5] CREDITS
                                                            echo     [6] EXIT
                                                            echo.
                                                            set /P VAR_CHOICE_MAIN=- CHOOSE AN OPTION [1-6]: 
if "%VAR_CHOICE_MAIN%"=="1" goto JP_InformationsMenu
if "%VAR_CHOICE_MAIN%"=="2" goto JP_CoreFilesMenu
if exist "%VAR_OUTPUT_MAIN_DIRECTORY%\" if "%VAR_CHOICE_MAIN%"=="3" goto JP_CoreFiles_Step2Menu
if exist "%VAR_OUTPUT_MAIN_DIRECTORY%\" if "%VAR_CHOICE_MAIN%"=="4" goto JP_AdditionalFilesMenu
if "%VAR_CHOICE_MAIN%"=="5" goto JP_CreditsMenu
if "%VAR_CHOICE_MAIN%"=="6" goto JP_ExitMenu
goto JP_MainMenu
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Main Menu - End = ::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Informations Menu - Begin = ::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:JP_InformationsMenu
cls
more /c "%VAR_FLOW_TEXT_DESCRIPTION%" & pause
goto JP_MainMenu
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Informations Menu - End = ::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Core Files Menu - Begin = ::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:JP_CoreFilesMenu
set VAR_FLOW_JUMPPOINT=JP_ReturnPoint_CoreFilesMenu
goto JP_CheckFiles
:JP_ReturnPoint_CoreFilesMenu
set VAR_FLOW_JUMPPOINT=JP_MainMenu
cls
if not exist "%VAR_OUTPUT_MAIN_DIRECTORY%\" goto JP_CoreFiles_Step1
                                                            type "%VAR_SCREEN_HEAD_UPPERPART%"
                                                            echo ==      // Main Menu // Restore core files                                                                           ==
                                                            type "%VAR_SCREEN_HEAD_LOWERPART%"
                                                            echo     Restoring the core mod files will erase the folder "Overmap_Rebalancing" at the location of this script.
                                                            echo     All installed additional content will be gone and needs to be installed again after this step has been completed.
                                                            echo     If you made any changes to the files in this folder: all of them will be gone too.
                                                            echo     Please backup all customised data within this folder before continuing.
                                                            echo.
                                                            echo     Do you want to restore the core mod files? 
                                                            echo.
                                                            echo     [Y] YES
                                                            echo     [N] NO
                                                            echo.
                                                            set /P VAR_CHOICE_CORE=- CHOOSE AN OPTION [Y/N]: 
if "%VAR_CHOICE_CORE%"=="Y" goto JP_CoreFiles_Step1
if "%VAR_CHOICE_CORE%"=="y" goto JP_CoreFiles_Step1
if "%VAR_CHOICE_CORE%"=="N" goto JP_MainMenu
if "%VAR_CHOICE_CORE%"=="n" goto JP_MainMenu
goto JP_CoreFilesMenu

:JP_CoreFiles_Step1
set VAR_FLOW_JUMPPOINT=JP_ReturnPoint_CoreFiles_Step1
if exist "%VAR_OUTPUT_MAIN_DIRECTORY%\" rd /s /q "%VAR_OUTPUT_MAIN_DIRECTORY%" >NUL
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_MAIN_DIRECTORY%" "%VAR_MODPART_CORE%"

:JP_ReturnPoint_CoreFiles_Step1
set VAR_FLOW_JUMPPOINT=JP_MainMenu
more /c "%VAR_FLOW_TEXT_STEP_01%" & pause

:JP_CoreFiles_Step2Menu
set VAR_FLOW_JUMPPOINT=JP_ReturnPoint_CoreFiles_Step2Menu
goto JP_CheckFiles
:JP_ReturnPoint_CoreFiles_Step2Menu
set VAR_FLOW_JUMPPOINT=JP_MainMenu
cls
if not exist "%VAR_OUTPUT_MAIN_DIRECTORY%\" goto JP_CoreFiles_Step1
                                                            type "%VAR_SCREEN_HEAD_UPPERPART%"
                                                            echo ==      // Core files configuration (Step 1 of 2)                                                                    ==
                                                            type "%VAR_SCREEN_HEAD_LOWERPART%"
                                                            echo     Please specify the settings for this mod for it to work like intended:
                                                            echo       1) Are you using the game included mod "PKs Reimagining"?                                 (YES? OPTION 1 AND 2)
                                                            echo       2) Do you want to revert the changes, made to the street connections of some structures?  (YES? OPTION 1 AND 3)
                                                            echo          (Labs, radio towers, fema camps, power stations, sais, hazardous waste sarcophagi, bunkers and silos
                                                            echo           are by default without street connections if you use Overmap Rebalancing in a world.)
                                                            echo.
                                                            echo     ATTENTION!
                                                            echo       If you choose to use "PKs Reimagining" in a world alongside Overmap Rebalancing, but don't include the support
                                                            echo       for PKs mod now, many of his monsters won't spawn!
                                                            echo       If you choose to include support for PKs mod now, create a world with Overmap Rebalancing but without PKs
                                                            echo       Reimaging, then there will errors occur!
                                                            echo.
                                                            echo     [1] INCLUDE SUPPORT FOR PKS REIMAGING AND REVERT THE STREET CONNECTIONS CHANGES
                                                            echo     [2] INCLUDE SUPPORT FOR PKS REIMAGING AND DON'T REVERT THE STREET CONNECTIONS CHANGES
                                                            echo     [3] DON'T INCLUDE SUPPORT FOR PKS REIMAGING AND REVERT THE STREET CONNECTIONS CHANGES
                                                            echo     [4] DON'T INCLUDE SUPPORT FOR PKS REIMAGING AND DON'T REVERT THE STREET CONNECTIONS CHANGES
                                                            echo.
                                                            set /P VAR_CHOICE_CORE_STEP2=- CHOOSE AN OPTION [1-4]: 
if "%VAR_CHOICE_CORE_STEP2%"=="1" goto JP_CoreFiles_Step2_C1
if "%VAR_CHOICE_CORE_STEP2%"=="2" goto JP_CoreFiles_Step2_C2
if "%VAR_CHOICE_CORE_STEP2%"=="3" goto JP_CoreFiles_Step2_C3
if "%VAR_CHOICE_CORE_STEP2%"=="4" goto JP_CoreFiles_Step3Menu
goto JP_CoreFiles_Step2Menu

:JP_CoreFiles_Step2_C1
set VAR_FLOW_JUMPPOINT=JP_CoreFiles_Step3Menu
if exist "%VAR_FLOW_USING_CORE_CONF_PLUSPK_PLUSSTREETS%" del /s /f /q "%VAR_FLOW_USING_CORE_CONF_PLUSPK_PLUSSTREETS%" >NUL
if exist "%VAR_FLOW_USING_CORE_CONF_PLUSPK_MINUSSTREETS%" del /s /f /q "%VAR_FLOW_USING_CORE_CONF_PLUSPK_MINUSSTREETS%" >NUL
if exist "%VAR_FLOW_USING_CORE_CONF_MINUSPK_PLUSSTREETS%" del /s /f /q "%VAR_FLOW_USING_CORE_CONF_MINUSPK_PLUSSTREETS%" >NUL
echo TRUE>"%VAR_CONF_MOD_PKSREIMAGINING%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_COMP_DIRECTORY%" "%VAR_MODPART_CORE_CONF_PLUSPK_PLUSSTREETS%"
:JP_CoreFiles_Step2_C2
set VAR_FLOW_JUMPPOINT=JP_CoreFiles_Step3Menu
if exist "%VAR_FLOW_USING_CORE_CONF_PLUSPK_PLUSSTREETS%" del /s /f /q "%VAR_FLOW_USING_CORE_CONF_PLUSPK_PLUSSTREETS%" >NUL
if exist "%VAR_FLOW_USING_CORE_CONF_PLUSPK_MINUSSTREETS%" del /s /f /q "%VAR_FLOW_USING_CORE_CONF_PLUSPK_MINUSSTREETS%" >NUL
if exist "%VAR_FLOW_USING_CORE_CONF_MINUSPK_PLUSSTREETS%" del /s /f /q "%VAR_FLOW_USING_CORE_CONF_MINUSPK_PLUSSTREETS%" >NUL
echo TRUE>"%VAR_CONF_MOD_PKSREIMAGINING%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_COMP_DIRECTORY%" "%VAR_MODPART_CORE_CONF_PLUSPK_MINUSSTREETS%"
:JP_CoreFiles_Step2_C3
set VAR_FLOW_JUMPPOINT=JP_CoreFiles_Step3Menu
if exist "%VAR_FLOW_USING_CORE_CONF_PLUSPK_PLUSSTREETS%" del /s /f /q "%VAR_FLOW_USING_CORE_CONF_PLUSPK_PLUSSTREETS%" >NUL
if exist "%VAR_FLOW_USING_CORE_CONF_PLUSPK_MINUSSTREETS%" del /s /f /q "%VAR_FLOW_USING_CORE_CONF_PLUSPK_MINUSSTREETS%" >NUL
if exist "%VAR_FLOW_USING_CORE_CONF_MINUSPK_PLUSSTREETS%" del /s /f /q "%VAR_FLOW_USING_CORE_CONF_MINUSPK_PLUSSTREETS%" >NUL
echo FALSE>"%VAR_CONF_MOD_PKSREIMAGINING%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_COMP_DIRECTORY%" "%VAR_MODPART_CORE_CONF_MINUSPK_PLUSSTREETS%"
REM :JP_ReturnPoint_CoreFiles_Step2
REM set VAR_FLOW_JUMPPOINT=JP_MainMenu
REM more /c "%VAR_FLOW_TEXT_STEP_02%" & pause

:JP_CoreFiles_Step3Menu
set VAR_FLOW_JUMPPOINT=JP_ReturnPoint_CoreFiles_Step3Menu
goto JP_CheckFiles
:JP_ReturnPoint_CoreFiles_Step3Menu
set VAR_FLOW_JUMPPOINT=JP_MainMenu
cls
if not exist "%VAR_OUTPUT_MAIN_DIRECTORY%\" goto JP_CoreFiles_Step1
                                                            type "%VAR_SCREEN_HEAD_UPPERPART%"
                                                            echo ==      // Core files configuration (Step 2 of 2)                                                                    ==
                                                            type "%VAR_SCREEN_HEAD_LOWERPART%"
                                                            echo     Please select, which of the following mods you're using in game words:
if not exist "%VAR_FLOW_USING_ARCANAMOD%"                   echo       1) The game included mod "Arcana and Magic Items"
if exist "%VAR_FLOW_USING_ARCANAMOD%"                       echo       1) The game included mod "Arcana and Magic Items"                                     [SUPPORT FILE INSTALLED]
if not exist "%VAR_FLOW_USING_MORELOCATIONS%"               echo       2) The game included mod "More Locations"
if exist "%VAR_FLOW_USING_MORELOCATIONS%"                   echo       2) The game included mod "More Locations"                                             [SUPPORT FILE INSTALLED]
if not exist "%VAR_FLOW_USING_TALLBUILDINGS%"               echo       3) The game included mod "Tall Buildings"
if exist "%VAR_FLOW_USING_TALLBUILDINGS%"                   echo       3) The game included mod "Tall Buildings"                                             [SUPPORT FILE INSTALLED]
if not exist "%VAR_FLOW_USING_MININGMOD%"                   echo       4) The external mod "Mining Mod"
if exist "%VAR_FLOW_USING_MININGMOD%"                       echo       4) The external mod "Mining Mod"                                                      [SUPPORT FILE INSTALLED]
                                                            echo.
                                                            echo     ATTENTION!
                                                            echo       There may occur system enquiries about file overwriting and/or folder merging. Answer these questions with "Ok".
                                                            echo.
if not exist "%VAR_FLOW_USING_ARCANAMOD%"                   echo     [1] APPEND "ARCANA AND MAGIC ITEMS" SUPPORT FILE
if exist "%VAR_FLOW_USING_ARCANAMOD%"                       echo     [1] REMOVE "ARCANA AND MAGIC ITEMS" SUPPORT FILE
if not exist "%VAR_FLOW_USING_MORELOCATIONS%"               echo     [2] APPEND "MORE LOCATIONS" SUPPORT FILE
if exist "%VAR_FLOW_USING_MORELOCATIONS%"                   echo     [2] REMOVE "MORE LOCATIONS" SUPPORT FILE
if not exist "%VAR_FLOW_USING_TALLBUILDINGS%"               echo     [3] APPEND "TALL BUILDINGS" SUPPORT FILE
if exist "%VAR_FLOW_USING_TALLBUILDINGS%"                   echo     [3] REMOVE "TALL BUILDINGS" SUPPORT FILE
if not exist "%VAR_FLOW_USING_MININGMOD%"                   echo     [4] APPEND "MINING MOD" SUPPORT FILE
if exist "%VAR_FLOW_USING_MININGMOD%"                       echo     [4] REMOVE "MINING MOD" SUPPORT FILE
                                                            echo     [5] FINALISE SELECTION
                                                            echo.
                                                            set /P VAR_CHOICE_CORE_STEP3=- CHOOSE AN OPTION [1-5]: 
if "%VAR_CHOICE_CORE_STEP3%"=="1" if not exist "%VAR_FLOW_USING_ARCANAMOD%" goto JP_CoreFiles_Step3_C1_Add
if "%VAR_CHOICE_CORE_STEP3%"=="1" if exist "%VAR_FLOW_USING_ARCANAMOD%" goto JP_CoreFiles_Step3_C1_Remove
if "%VAR_CHOICE_CORE_STEP3%"=="2" if not exist "%VAR_FLOW_USING_MORELOCATIONS%" goto JP_CoreFiles_Step3_C2
if "%VAR_CHOICE_CORE_STEP3%"=="2" if exist "%VAR_FLOW_USING_MORELOCATIONS%" del /s /f /q "%VAR_FLOW_USING_MORELOCATIONS%" >NUL & echo FALSE>"%VAR_CONF_MOD_MORELOCATIONS%"
if "%VAR_CHOICE_CORE_STEP3%"=="3" if not exist "%VAR_FLOW_USING_TALLBUILDINGS%" goto JP_CoreFiles_Step3_C3
if "%VAR_CHOICE_CORE_STEP3%"=="3" if exist "%VAR_FLOW_USING_TALLBUILDINGS%" del /s /f /q "%VAR_FLOW_USING_TALLBUILDINGS%" >NUL & echo FALSE>"%VAR_CONF_MOD_TALLBUILDINGS%"
if "%VAR_CHOICE_CORE_STEP3%"=="4" if not exist "%VAR_FLOW_USING_MININGMOD%" goto JP_CoreFiles_Step3_C4
if "%VAR_CHOICE_CORE_STEP3%"=="4" if exist "%VAR_FLOW_USING_MININGMOD%" del /s /f /q "%VAR_FLOW_USING_MININGMOD%" >NUL & echo FALSE>"%VAR_CONF_MOD_MININGMOD%"
if "%VAR_CHOICE_CORE_STEP3%"=="5" goto JP_ReturnPoint_CoreFiles_Step3
goto JP_CoreFiles_Step3Menu

:JP_CoreFiles_Step3_C1_Add
set VAR_FLOW_JUMPPOINT=JP_CoreFiles_Step3Menu
if not exist "%VAR_FLOW_USING_ARCANAMOD%" goto JP_CoreFiles_Step3_C1_Add_Part1
set /p VAR_TEMP=<"%VAR_CONF_BS_EXPLODED%"
if "%VAR_TEMP%"=="TRUE" if not exist "%VAR_FLOW_USING_EXPLODED_ARCANA%\" goto JP_CoreFiles_Step3_C1_Add_Part2
echo TRUE>"%VAR_CONF_MOD_ARCANAMOD%"
goto JP_CoreFiles_Step3Menu
:JP_CoreFiles_Step3_C1_Add_Part1
set VAR_FLOW_JUMPPOINT=JP_CoreFiles_Step3_C1_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_RMBS_DIRECTORY%" "%VAR_MODPART_MODSUPPORT_ARCANAMOD%"
:JP_CoreFiles_Step3_C1_Add_Part2
set VAR_FLOW_JUMPPOINT=JP_CoreFiles_Step3_C1_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_ARCANA%"
:JP_CoreFiles_Step3_C1_Remove
if exist "%VAR_FLOW_USING_ARCANAMOD%" del /s /f /q "%VAR_FLOW_USING_ARCANAMOD%" >NUL
echo FALSE>"%VAR_CONF_MOD_ARCANAMOD%"
goto JP_CoreFiles_Step3Menu

:JP_CoreFiles_Step3_C2
set VAR_FLOW_JUMPPOINT=JP_CoreFiles_Step3Menu
echo TRUE>"%VAR_CONF_MOD_MORELOCATIONS%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_RMBS_DIRECTORY%" "%VAR_MODPART_MODSUPPORT_MORELOCATIONS%"

:JP_CoreFiles_Step3_C3
set VAR_FLOW_JUMPPOINT=JP_CoreFiles_Step3Menu
echo TRUE>"%VAR_CONF_MOD_TALLBUILDINGS%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_RMBS_DIRECTORY%" "%VAR_MODPART_MODSUPPORT_TALLBUILDINGS%"

:JP_CoreFiles_Step3_C4
set VAR_FLOW_JUMPPOINT=JP_CoreFiles_Step3Menu
echo TRUE>"%VAR_CONF_MOD_MININGMOD%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_RMBS_DIRECTORY%" "%VAR_MODPART_MODSUPPORT_MININGMOD%"

:JP_ReturnPoint_CoreFiles_Step3
set VAR_FLOW_JUMPPOINT=JP_MainMenu
if exist "%VAR_FLOW_USING_COMP_ADD_DIN%" del /s /f /q "%VAR_FLOW_USING_COMP_ADD_DIN%" >NUL
if exist "%VAR_FLOW_USING_COMP_ADD_DIN_PKS%" del /s /f /q "%VAR_FLOW_USING_COMP_ADD_DIN_PKS%" >NUL
if exist "%VAR_FLOW_USING_COMP_ADD_PKS%" del /s /f /q "%VAR_FLOW_USING_COMP_ADD_PKS%" >NUL
if exist "%VAR_FLOW_USING_COMP_DIN_PKS%" del /s /f /q "%VAR_FLOW_USING_COMP_DIN_PKS%" >NUL
set /p VAR_TEMP_A=<"%VAR_CONF_MOD_ADDBANDITS%"
set /p VAR_TEMP_D=<"%VAR_CONF_MOD_DINOMOD%"
set /p VAR_TEMP_P=<"%VAR_CONF_MOD_PKSREIMAGINING%"
if "%VAR_TEMP_A%"=="TRUE" if "%VAR_TEMP_D%"=="TRUE" if "%VAR_TEMP_P%"=="TRUE" cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_COMP_DIRECTORY%" "%VAR_MODPART_COMP_ADD_DIN_PKS%"
if "%VAR_TEMP_A%"=="TRUE" if "%VAR_TEMP_D%"=="TRUE" if "%VAR_TEMP_P%"=="FALSE" cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_COMP_DIRECTORY%" "%VAR_MODPART_COMP_ADD_DIN%"
if "%VAR_TEMP_A%"=="TRUE" if "%VAR_TEMP_D%"=="FALSE" if "%VAR_TEMP_P%"=="TRUE" cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_COMP_DIRECTORY%" "%VAR_MODPART_COMP_ADD_PKS%"
if "%VAR_TEMP_A%"=="FALSE" if "%VAR_TEMP_D%"=="TRUE" if "%VAR_TEMP_P%"=="TRUE" cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_COMP_DIRECTORY%" "%VAR_MODPART_COMP_DIN_PKS%"
more /c "%VAR_FLOW_TEXT_STEP_03%" & pause
goto JP_MainMenu
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Core Files Menu - End = ::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Additional Files Menu - Begin = ::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:JP_AdditionalFilesMenu
set VAR_FLOW_JUMPPOINT=JP_ReturnPoint_AdditionalFilesMenu
goto JP_CheckFiles
:JP_ReturnPoint_AdditionalFilesMenu
set VAR_FLOW_JUMPPOINT=JP_MainMenu
cls
if not exist "%VAR_OUTPUT_MAIN_DIRECTORY%\" goto JP_CoreFiles_Step1
                                                            type "%VAR_SCREEN_HEAD_UPPERPART%"
                                                            echo ==      // Main Menu // Install additional mod files                                                                 ==
                                                            type "%VAR_SCREEN_HEAD_LOWERPART%"
                                                            echo     Here you can install additional content for the Overmap Rebalancing Mod:
                                                            echo      - Additional mods, integrated into the Overmap Rebalancing Mod. There are available:
                                                            echo         "Add Bandits", "Animatronics", "DinoMod", "Extended Buildings" and "Parks and Recreation Buildings Pack"
                                                            echo         Credit to the creators and informations to the content of these mods can be found under "CREDITS AND CONTENT".
                                                            echo      - Additional building variations:
                                                            echo         Ambushed, burned, exploded, looted, and shelled building variations of existing building types
                                                            echo         (For basegame buildings, buildings from Overmap Rebalancing and some of the additional mods)
                                                            echo.
                                                            echo     If you choose to use only some additional content, the setup process automatically installs all necessary
                                                            echo     compatibility files.
                                                            echo.
                                                            echo     [1] INSTALL ALL ADDITIONAL CONTENT
                                                            echo     [2] INSTALL SOME ADDITIONAL CONTENT
                                                            echo     [3] CREDITS AND CONTENT
                                                            echo     [4] BACK TO MAIN MENU
                                                            echo.
                                                            set /P VAR_CHOICE_ADDITION=- CHOOSE AN OPTION [1-4]: 
if "%VAR_CHOICE_ADDITION%"=="1" goto JP_AdditionalFiles_All_Step01
if "%VAR_CHOICE_ADDITION%"=="2" goto JP_AdditionalFiles_SomeStep1Menu
if "%VAR_CHOICE_ADDITION%"=="3" goto JP_CreditsMenu
if "%VAR_CHOICE_ADDITION%"=="4" goto JP_MainMenu
goto JP_AdditionalFilesMenu

:JP_AdditionalFiles_All_Step01
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_All_Step02
echo TRUE>"%VAR_CONF_MOD_ADDBANDITS%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_MODS_DIRECTORY%" "%VAR_MODPART_MOD_ADDBANDITS%"
:JP_AdditionalFiles_All_Step02
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_All_Step03
echo TRUE>"%VAR_CONF_MOD_ANIMATRONICS%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_MODS_DIRECTORY%" "%VAR_MODPART_MOD_ANIMATRONICS%"
:JP_AdditionalFiles_All_Step03
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_All_Step04
echo TRUE>"%VAR_CONF_MOD_DINOMOD%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_MODS_DIRECTORY%" "%VAR_MODPART_MOD_DINOMOD%"
:JP_AdditionalFiles_All_Step04
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_All_Step05
echo TRUE>"%VAR_CONF_MOD_EXTENDEDBUILDINGS%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_MODS_DIRECTORY%" "%VAR_MODPART_MOD_EXTENDEDBUILDINGS%"
:JP_AdditionalFiles_All_Step05
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_All_Step06
echo TRUE>"%VAR_CONF_MOD_PARKSRECBUILDINGS%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_MODS_DIRECTORY%" "%VAR_MODPART_MOD_PARKSRECBUILDINGS%"
:JP_AdditionalFiles_All_Step06
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_All_Step07
REM echo TRUE>"%VAR_CONF_BS_AMBUSHED%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_AMBUSHED_ADDBANDITS%"
:JP_AdditionalFiles_All_Step07
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_All_Step08
echo TRUE>"%VAR_CONF_BS_AMBUSHED%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_AMBUSHED_BASEGAME%"
:JP_AdditionalFiles_All_Step08
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_All_Step09
echo TRUE>"%VAR_CONF_BS_BURNED%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_BURNED_BASEGAME%"
:JP_AdditionalFiles_All_Step09
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_All_Step10
echo TRUE>"%VAR_CONF_BS_EXPLODED%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_BASEGAME%"
:JP_AdditionalFiles_All_Step10
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_All_Step11
REM echo TRUE>"%VAR_CONF_BS_EXPLODED%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_ANIMATRONICS%"
:JP_AdditionalFiles_All_Step11
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_All_Step12
REM echo TRUE>"%VAR_CONF_BS_EXPLODED%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_ARCANA%"
:JP_AdditionalFiles_All_Step12
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_All_Step13
REM echo TRUE>"%VAR_CONF_BS_EXPLODED%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_DINOMOD%"
:JP_AdditionalFiles_All_Step13
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_All_Step14
REM echo TRUE>"%VAR_CONF_BS_EXPLODED%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_EXTENDEDBUILDINGS%"
:JP_AdditionalFiles_All_Step14
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_All_Step15
REM echo TRUE>"%VAR_CONF_BS_EXPLODED%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_PARKSRECBUILDINGS%"
:JP_AdditionalFiles_All_Step15
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_All_Step16
echo TRUE>"%VAR_CONF_BS_LOOTED%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_LOOTED_BASEGAME%"
:JP_AdditionalFiles_All_Step16
set VAR_FLOW_JUMPPOINT=JP_ReturnPoint_AdditionalFiles_All
echo TRUE>"%VAR_CONF_BS_SHELLED%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_SHELLED_BASEGAME%"
:JP_ReturnPoint_AdditionalFiles_All
set VAR_FLOW_JUMPPOINT=JP_MainMenu
more /c "%VAR_FLOW_TEXT_STEP_04%" & pause
goto JP_MainMenu


:JP_AdditionalFiles_SomeStep1Menu
set VAR_FLOW_JUMPPOINT=JP_ReturnPoint_AdditionalFiles_SomeStep1Menu
goto JP_CheckFiles
:JP_ReturnPoint_AdditionalFiles_SomeStep1Menu
set VAR_FLOW_JUMPPOINT=JP_MainMenu
cls
if not exist "%VAR_OUTPUT_MAIN_DIRECTORY%\" goto JP_CoreFiles_Step1
                                                            type "%VAR_SCREEN_HEAD_UPPERPART%"
                                                            echo ==      // Main Menu // Install additional mod files (Step 1 of 2)                                                   ==
                                                            type "%VAR_SCREEN_HEAD_LOWERPART%"
                                                            echo     Please select which of the following mods should be installed:
if not exist "%VAR_FLOW_USING_ADDBANDITS%\"                 echo       1) "Add Bandits"
if exist "%VAR_FLOW_USING_ADDBANDITS%\"                     echo       1) "Add Bandits"                                                                               [MOD INSTALLED]
if not exist "%VAR_FLOW_USING_ANIMATRONICS%\"               echo       2) "Animatronis"
if exist "%VAR_FLOW_USING_ANIMATRONICS%\"                   echo       2) "Animatronis"                                                                               [MOD INSTALLED]
if not exist "%VAR_FLOW_USING_DINOMOD%\"                    echo       3) "Dino Mod"
if exist "%VAR_FLOW_USING_DINOMOD%\"                        echo       3) "Dino Mod"                                                                                  [MOD INSTALLED]
if not exist "%VAR_FLOW_USING_EXTENDEDBUILDINGS%\"          echo       4) "Extended Buildings"
if exist "%VAR_FLOW_USING_EXTENDEDBUILDINGS%\"              echo       4) "Extended Buildings"                                                                        [MOD INSTALLED]
if not exist "%VAR_FLOW_USING_PARKSRECBUILDINGS%\"          echo       5) "Parks and Recreation Buildings Pack"
if exist "%VAR_FLOW_USING_PARKSRECBUILDINGS%\"              echo       5) "Parks and Recreation Buildings Pack"                                                       [MOD INSTALLED]
                                                            echo.
                                                            echo     ATTENTION!
                                                            echo       There may occur system enquiries about file overwriting and/or folder merging.
                                                            echo       Answer these questions with "OK".
                                                            echo.
if not exist "%VAR_FLOW_USING_ADDBANDITS%\"                 echo     [1] APPEND MOD "ADD BANDITS"
if exist "%VAR_FLOW_USING_ADDBANDITS%\"                     echo     [1] REMOVE MOD "ADD BANDITS"
if not exist "%VAR_FLOW_USING_ANIMATRONICS%\"               echo     [2] APPEND MOD "ANIMATRONICS"
if exist "%VAR_FLOW_USING_ANIMATRONICS%\"                   echo     [2] REMOVE MOD "ANIMATRONICS"
if not exist "%VAR_FLOW_USING_DINOMOD%\"                    echo     [3] APPEND MOD "DINO MOD"
if exist "%VAR_FLOW_USING_DINOMOD%\"                        echo     [3] REMOVE MOD "DINO MOD"
if not exist "%VAR_FLOW_USING_EXTENDEDBUILDINGS%\"          echo     [4] APPEND MOD "EXTENDED BUILDINGS"
if exist "%VAR_FLOW_USING_EXTENDEDBUILDINGS%\"              echo     [4] REMOVE MOD "EXTENDED BUILDINGS"
if not exist "%VAR_FLOW_USING_PARKSRECBUILDINGS%\"          echo     [5] APPEND MOD "PARKS AND RECREATION BUILDINGS PACK"
if exist "%VAR_FLOW_USING_PARKSRECBUILDINGS%\"              echo     [5] REMOVE MOD "PARKS AND RECREATION BUILDINGS PACK"
                                                            echo     [6] FINALISE SELECTION
                                                            echo.
                                                            set /P VAR_CHOICE_ADDITION_STEP1=- CHOOSE AN OPTION [1-6]: 
if "%VAR_CHOICE_ADDITION_STEP1%"=="1" if not exist "%VAR_FLOW_USING_ADDBANDITS%\" goto JP_AdditionalFiles_SomeStep1_C1_Add
if "%VAR_CHOICE_ADDITION_STEP1%"=="1" if exist "%VAR_FLOW_USING_ADDBANDITS%\" goto JP_AdditionalFiles_SomeStep1_C1_Remove
if "%VAR_CHOICE_ADDITION_STEP1%"=="2" if not exist "%VAR_FLOW_USING_ANIMATRONICS%\" goto JP_AdditionalFiles_SomeStep1_C2_Add
if "%VAR_CHOICE_ADDITION_STEP1%"=="2" if exist "%VAR_FLOW_USING_ANIMATRONICS%\" goto JP_AdditionalFiles_SomeStep1_C2_Remove
if "%VAR_CHOICE_ADDITION_STEP1%"=="3" if not exist "%VAR_FLOW_USING_DINOMOD%\" goto JP_AdditionalFiles_SomeStep1_C3_Add
if "%VAR_CHOICE_ADDITION_STEP1%"=="3" if exist "%VAR_FLOW_USING_DINOMOD%\" goto JP_AdditionalFiles_SomeStep1_C3_Remove
if "%VAR_CHOICE_ADDITION_STEP1%"=="4" if not exist "%VAR_FLOW_USING_EXTENDEDBUILDINGS%\" goto JP_AdditionalFiles_SomeStep1_C4_Add
if "%VAR_CHOICE_ADDITION_STEP1%"=="4" if exist "%VAR_FLOW_USING_EXTENDEDBUILDINGS%\" goto JP_AdditionalFiles_SomeStep1_C4_Remove
if "%VAR_CHOICE_ADDITION_STEP1%"=="5" if not exist "%VAR_FLOW_USING_PARKSRECBUILDINGS%\" goto JP_AdditionalFiles_SomeStep1_C5_Add
if "%VAR_CHOICE_ADDITION_STEP1%"=="5" if exist "%VAR_FLOW_USING_PARKSRECBUILDINGS%\" goto JP_AdditionalFiles_SomeStep1_C5_Remove
if "%VAR_CHOICE_ADDITION_STEP1%"=="6" goto JP_ReturnPoint_AdditionalFiles_SomeStep1
goto JP_AdditionalFiles_SomeStep1Menu

:JP_AdditionalFiles_SomeStep1_C1_Add
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep1Menu
if not exist "%VAR_FLOW_USING_ADDBANDITS%\" goto JP_AdditionalFiles_SomeStep1_C1_Add_Part1
set /p VAR_TEMP=<"%VAR_CONF_BS_AMBUSHED%"
if "%VAR_TEMP%"=="TRUE" if not exist "%VAR_FLOW_USING_AMBUSHED_ADDBANDITS%\" goto JP_AdditionalFiles_SomeStep1_C1_Add_Part2
echo TRUE>"%VAR_CONF_MOD_ADDBANDITS%"
goto JP_AdditionalFiles_SomeStep1Menu
:JP_AdditionalFiles_SomeStep1_C1_Add_Part1
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep1_C1_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_MODS_DIRECTORY%" "%VAR_MODPART_MOD_ADDBANDITS%"
:JP_AdditionalFiles_SomeStep1_C1_Add_Part2
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep1_C1_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_AMBUSHED_ADDBANDITS%"
:JP_AdditionalFiles_SomeStep1_C1_Remove
if exist "%VAR_FLOW_USING_ADDBANDITS%\" rd /s /q "%VAR_FLOW_USING_ADDBANDITS%" >NUL
echo FALSE>"%VAR_CONF_MOD_ADDBANDITS%"
goto JP_AdditionalFiles_SomeStep1Menu

:JP_AdditionalFiles_SomeStep1_C2_Add
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep1Menu
if not exist "%VAR_FLOW_USING_ANIMATRONICS%\" goto JP_AdditionalFiles_SomeStep1_C2_Add_Part1
set /p VAR_TEMP=<"%VAR_CONF_BS_EXPLODED%"
if "%VAR_TEMP%"=="TRUE" if not exist "%VAR_FLOW_USING_EXPLODED_ANIMATRONICS%\" goto JP_AdditionalFiles_SomeStep1_C2_Add_Part2
echo TRUE>"%VAR_CONF_MOD_ANIMATRONICS%"
goto JP_AdditionalFiles_SomeStep1Menu
:JP_AdditionalFiles_SomeStep1_C2_Add_Part1
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep1_C2_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_MODS_DIRECTORY%" "%VAR_MODPART_MOD_ANIMATRONICS%"
:JP_AdditionalFiles_SomeStep1_C2_Add_Part2
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep1_C2_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_ANIMATRONICS%"
:JP_AdditionalFiles_SomeStep1_C2_Remove
if exist "%VAR_FLOW_USING_ANIMATRONICS%\" rd /s /q "%VAR_FLOW_USING_ANIMATRONICS%" >NUL
if exist "%VAR_FLOW_USING_EXPLODED_ANIMATRONICS%\" rd /s /q "%VAR_FLOW_USING_EXPLODED_ANIMATRONICS%" >NUL
echo FALSE>"%VAR_CONF_MOD_ANIMATRONICS%"
goto JP_AdditionalFiles_SomeStep1Menu

:JP_AdditionalFiles_SomeStep1_C3_Add
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep1Menu
if not exist "%VAR_FLOW_USING_DINOMOD%\" goto JP_AdditionalFiles_SomeStep1_C3_Add_Part1
set /p VAR_TEMP=<"%VAR_CONF_BS_EXPLODED%"
if "%VAR_TEMP%"=="TRUE" if not exist "%VAR_FLOW_USING_EXPLODED_DINOMOD%\" goto JP_AdditionalFiles_SomeStep1_C3_Add_Part2
echo TRUE>"%VAR_CONF_MOD_DINOMOD%"
goto JP_AdditionalFiles_SomeStep1Menu
:JP_AdditionalFiles_SomeStep1_C3_Add_Part1
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep1_C3_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_MODS_DIRECTORY%" "%VAR_MODPART_MOD_DINOMOD%"
:JP_AdditionalFiles_SomeStep1_C3_Add_Part2
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep1_C3_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_DINOMOD%"
:JP_AdditionalFiles_SomeStep1_C3_Remove
if exist "%VAR_FLOW_USING_DINOMOD%\" rd /s /q "%VAR_FLOW_USING_DINOMOD%" >NUL
if exist "%VAR_FLOW_USING_EXPLODED_DINOMOD%\" rd /s /q "%VAR_FLOW_USING_EXPLODED_DINOMOD%" >NUL
echo FALSE>"%VAR_CONF_MOD_DINOMOD%"
goto JP_AdditionalFiles_SomeStep1Menu

:JP_AdditionalFiles_SomeStep1_C4_Add
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep1Menu
if not exist "%VAR_FLOW_USING_EXTENDEDBUILDINGS%\" goto JP_AdditionalFiles_SomeStep1_C4_Add_Part1
set /p VAR_TEMP=<"%VAR_CONF_BS_EXPLODED%"
if "%VAR_TEMP%"=="TRUE" if not exist "%VAR_FLOW_USING_EXPLODED_EXTENDEDBUILDINGS%\" goto JP_AdditionalFiles_SomeStep1_C4_Add_Part2
echo TRUE>"%VAR_CONF_MOD_EXTENDEDBUILDINGS%"
goto JP_AdditionalFiles_SomeStep1Menu
:JP_AdditionalFiles_SomeStep1_C4_Add_Part1
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep1_C4_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_MODS_DIRECTORY%" "%VAR_MODPART_MOD_EXTENDEDBUILDINGS%"
:JP_AdditionalFiles_SomeStep1_C4_Add_Part2
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep1_C4_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_EXTENDEDBUILDINGS%"
:JP_AdditionalFiles_SomeStep1_C4_Remove
if exist "%VAR_FLOW_USING_EXTENDEDBUILDINGS%\" rd /s /q "%VAR_FLOW_USING_EXTENDEDBUILDINGS%" >NUL
if exist "%VAR_FLOW_USING_EXPLODED_EXTENDEDBUILDINGS%\" rd /s /q "%VAR_FLOW_USING_EXPLODED_EXTENDEDBUILDINGS%" >NUL
echo FALSE>"%VAR_CONF_MOD_EXTENDEDBUILDINGS%"
goto JP_AdditionalFiles_SomeStep1Menu

:JP_AdditionalFiles_SomeStep1_C5_Add
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep1Menu
if not exist "%VAR_FLOW_USING_PARKSRECBUILDINGS%\" goto JP_AdditionalFiles_SomeStep1_C5_Add_Part1
set /p VAR_TEMP=<"%VAR_CONF_BS_EXPLODED%"
if "%VAR_TEMP%"=="TRUE" if not exist "%VAR_FLOW_USING_EXPLODED_PARKSRECBUILDINGS%\" goto JP_AdditionalFiles_SomeStep1_C5_Add_Part2
echo TRUE>"%VAR_CONF_MOD_PARKSRECBUILDINGS%"
goto JP_AdditionalFiles_SomeStep1Menu
:JP_AdditionalFiles_SomeStep1_C5_Add_Part1
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep1_C5_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_MODS_DIRECTORY%" "%VAR_MODPART_MOD_PARKSRECBUILDINGS%"
:JP_AdditionalFiles_SomeStep1_C5_Add_Part2
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep1_C5_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_PARKSRECBUILDINGS%"
:JP_AdditionalFiles_SomeStep1_C5_Remove
if exist "%VAR_FLOW_USING_PARKSRECBUILDINGS%\" rd /s /q "%VAR_FLOW_USING_PARKSRECBUILDINGS%" >NUL
if exist "%VAR_FLOW_USING_EXPLODED_PARKSRECBUILDINGS%\" rd /s /q "%VAR_FLOW_USING_EXPLODED_PARKSRECBUILDINGS%" >NUL
echo FALSE>"%VAR_CONF_MOD_PARKSRECBUILDINGS%"
goto JP_AdditionalFiles_SomeStep1Menu

:JP_ReturnPoint_AdditionalFiles_SomeStep1
set VAR_FLOW_JUMPPOINT=JP_MainMenu
REM more /c "%VAR_FLOW_TEXT_STEP_05%" & pause


:JP_AdditionalFiles_SomeStep2Menu
set VAR_FLOW_JUMPPOINT=JP_ReturnPoint_AdditionalFiles_SomeStep2Menu
goto JP_CheckFiles
:JP_ReturnPoint_AdditionalFiles_SomeStep2Menu
set VAR_FLOW_JUMPPOINT=JP_MainMenu
cls
if not exist "%VAR_OUTPUT_MAIN_DIRECTORY%\" goto JP_CoreFiles_Step2
                                                            type "%VAR_SCREEN_HEAD_UPPERPART%"
                                                            echo ==      // Main Menu // Install additional mod files (Step 2 of 2)                                                   ==
                                                            type "%VAR_SCREEN_HEAD_LOWERPART%"
                                                            echo     Please select which of the following additional building variations should be installed:
if not exist "%VAR_FLOW_USING_AMBUSHED_BASEGAME%\"          echo       1) Ambushed Buildings
if exist "%VAR_FLOW_USING_AMBUSHED_BASEGAME%\"              echo       1) Ambushed Buildings                                                                              [INSTALLED]
if not exist "%VAR_FLOW_USING_BURNED_BASEGAME%\"            echo       2) Burned Buildings
if exist "%VAR_FLOW_USING_BURNED_BASEGAME%\"                echo       2) Burned Buildings                                                                                [INSTALLED]
if not exist "%VAR_FLOW_USING_EXPLODED_BASEGAME%\"          echo       3) Exploded Buildings
if exist "%VAR_FLOW_USING_EXPLODED_BASEGAME%\"              echo       3) Exploded Buildings                                                                              [INSTALLED]
if not exist "%VAR_FLOW_USING_LOOTED_BASEGAME%\"            echo       4) Looted Buildings
if exist "%VAR_FLOW_USING_LOOTED_BASEGAME%\"                echo       4) Looted Buildings                                                                                [INSTALLED]
if not exist "%VAR_FLOW_USING_SHELLED_BASEGAME%\"           echo       5) Shelled Buildings
if exist "%VAR_FLOW_USING_SHELLED_BASEGAME%\"               echo       5) Shelled Buildings                                                                               [INSTALLED]
                                                            echo.
                                                            echo     ATTENTION!
                                                            echo       There may occur system enquiries about file overwriting and/or folder merging.
                                                            echo       Answer these questions with "OK".
                                                            echo.
if not exist "%VAR_FLOW_USING_AMBUSHED_BASEGAME%\"          echo     [1] APPEND AMBUSHED BUILDINGS FILES
if exist "%VAR_FLOW_USING_AMBUSHED_BASEGAME%\"              echo     [1] REMOVE AMBUSHED BUILDINGS FILES
if not exist "%VAR_FLOW_USING_BURNED_BASEGAME%\"            echo     [2] APPEND BURNED BUILDINGS FILES
if exist "%VAR_FLOW_USING_BURNED_BASEGAME%\"                echo     [2] REMOVE BURNED BUILDINGS FILES
if not exist "%VAR_FLOW_USING_EXPLODED_BASEGAME%\"          echo     [3] APPEND EXPLODED BUILDINGS FILES
if exist "%VAR_FLOW_USING_EXPLODED_BASEGAME%\"              echo     [3] REMOVE EXPLODED BUILDINGS FILES
if not exist "%VAR_FLOW_USING_LOOTED_BASEGAME%\"            echo     [4] APPEND LOOTED BUILDINGS FILES
if exist "%VAR_FLOW_USING_LOOTED_BASEGAME%\"                echo     [4] REMOVE LOOTED BUILDINGS FILES
if not exist "%VAR_FLOW_USING_SHELLED_BASEGAME%\"           echo     [5] APPEND SHELLED BUILDINGS FILES
if exist "%VAR_FLOW_USING_SHELLED_BASEGAME%\"               echo     [5] REMOVE SHELLED BUILDINGS FILES
                                                            echo     [6] FINALISE SELECTION
                                                            echo.
                                                            set /P VAR_CHOICE_ADDITION_STEP2=- CHOOSE AN OPTION [1-6]: 
if "%VAR_CHOICE_ADDITION_STEP2%"=="1" if not exist "%VAR_FLOW_USING_AMBUSHED_BASEGAME%\" goto JP_AdditionalFiles_SomeStep2_C1_Add
if "%VAR_CHOICE_ADDITION_STEP2%"=="1" if exist "%VAR_FLOW_USING_AMBUSHED_BASEGAME%\" goto JP_AdditionalFiles_SomeStep2_C1_Remove
if "%VAR_CHOICE_ADDITION_STEP2%"=="2" if not exist "%VAR_FLOW_USING_BURNED_BASEGAME%\" goto JP_AdditionalFiles_SomeStep2_C2_Add
if "%VAR_CHOICE_ADDITION_STEP2%"=="2" if exist "%VAR_FLOW_USING_BURNED_BASEGAME%\" goto JP_AdditionalFiles_SomeStep2_C2_Remove
if "%VAR_CHOICE_ADDITION_STEP2%"=="3" if not exist "%VAR_FLOW_USING_EXPLODED_BASEGAME%\" goto JP_AdditionalFiles_SomeStep2_C3_Add
if "%VAR_CHOICE_ADDITION_STEP2%"=="3" if exist "%VAR_FLOW_USING_EXPLODED_BASEGAME%\" goto JP_AdditionalFiles_SomeStep2_C3_Remove
if "%VAR_CHOICE_ADDITION_STEP2%"=="4" if not exist "%VAR_FLOW_USING_LOOTED_BASEGAME%\" goto JP_AdditionalFiles_SomeStep2_C4_Add
if "%VAR_CHOICE_ADDITION_STEP2%"=="4" if exist "%VAR_FLOW_USING_LOOTED_BASEGAME%\" goto JP_AdditionalFiles_SomeStep2_C4_Remove
if "%VAR_CHOICE_ADDITION_STEP2%"=="5" if not exist "%VAR_FLOW_USING_SHELLED_BASEGAME%\" goto JP_AdditionalFiles_SomeStep2_C5_Add
if "%VAR_CHOICE_ADDITION_STEP2%"=="5" if exist "%VAR_FLOW_USING_SHELLED_BASEGAME%\" goto JP_AdditionalFiles_SomeStep2_C5_Remove
if "%VAR_CHOICE_ADDITION_STEP2%"=="6" goto JP_ReturnPoint_AdditionalFiles_SomeStep2
goto JP_AdditionalFiles_SomeStep2Menu

:JP_AdditionalFiles_SomeStep2_C1_Add
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep2Menu
if not exist "%VAR_FLOW_USING_AMBUSHED_BASEGAME%\" goto JP_AdditionalFiles_SomeStep2_C1_Add_Part1
set /p VAR_TEMP=<"%VAR_CONF_MOD_ADDBANDITS%"
if "%VAR_TEMP%"=="TRUE" if not exist "%VAR_FLOW_USING_AMBUSHED_ADDBANDITS%\" goto JP_AdditionalFiles_SomeStep2_C1_Add_Part2
echo TRUE>"%VAR_CONF_BS_AMBUSHED%"
goto JP_AdditionalFiles_SomeStep2Menu
:JP_AdditionalFiles_SomeStep2_C1_Add_Part1
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep2_C1_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_AMBUSHED_BASEGAME%"
:JP_AdditionalFiles_SomeStep2_C1_Add_Part2
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep2_C1_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_AMBUSHED_ADDBANDITS%"
:JP_AdditionalFiles_SomeStep2_C1_Remove
if exist "%VAR_FLOW_USING_AMBUSHED_BASEGAME%\" rd /s /q "%VAR_FLOW_USING_AMBUSHED_BASEGAME%" >NUL
if exist "%VAR_FLOW_USING_AMBUSHED_ADDBANDITS%\" rd /s /q "%VAR_FLOW_USING_AMBUSHED_ADDBANDITS%" >NUL
echo FALSE>"%VAR_CONF_BS_AMBUSHED%"
goto JP_AdditionalFiles_SomeStep2Menu

:JP_AdditionalFiles_SomeStep2_C2_Add
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep2Menu
echo TRUE>"%VAR_CONF_BS_BURNED%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_BURNED_BASEGAME%"
:JP_AdditionalFiles_SomeStep2_C2_Remove
if exist "%VAR_FLOW_USING_BURNED_BASEGAME%\" rd /s /q "%VAR_FLOW_USING_BURNED_BASEGAME%" >NUL
echo FALSE>"%VAR_CONF_BS_BURNED%"
goto JP_AdditionalFiles_SomeStep2Menu

:JP_AdditionalFiles_SomeStep2_C3_Add
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep2Menu
if not exist "%VAR_FLOW_USING_EXPLODED_BASEGAME%\" goto JP_AdditionalFiles_SomeStep2_C3_Add_Part1
set /p VAR_TEMP=<"%VAR_CONF_MOD_ANIMATRONICS%"
if "%VAR_TEMP%"=="TRUE" if not exist "%VAR_FLOW_USING_EXPLODED_ANIMATRONICS%\" goto JP_AdditionalFiles_SomeStep2_C3_Add_Part2
set /p VAR_TEMP=<"%VAR_CONF_MOD_ARCANAMOD%"
if "%VAR_TEMP%"=="TRUE" if not exist "%VAR_FLOW_USING_EXPLODED_ARCANA%\" goto JP_AdditionalFiles_SomeStep2_C3_Add_Part3
set /p VAR_TEMP=<"%VAR_CONF_MOD_DINOMOD%"
if "%VAR_TEMP%"=="TRUE" if not exist "%VAR_FLOW_USING_EXPLODED_DINOMOD%\" goto JP_AdditionalFiles_SomeStep2_C3_Add_Part4
set /p VAR_TEMP=<"%VAR_CONF_MOD_EXTENDEDBUILDINGS%"
if "%VAR_TEMP%"=="TRUE" if not exist "%VAR_FLOW_USING_EXPLODED_EXTENDEDBUILDINGS%\" goto JP_AdditionalFiles_SomeStep2_C3_Add_Part5
set /p VAR_TEMP=<"%VAR_CONF_MOD_PARKSRECBUILDINGS%"
if "%VAR_TEMP%"=="TRUE" if not exist "%VAR_FLOW_USING_EXPLODED_PARKSRECBUILDINGS%\" goto JP_AdditionalFiles_SomeStep2_C3_Add_Part6
echo TRUE>"%VAR_CONF_BS_EXPLODED%"
goto JP_AdditionalFiles_SomeStep2Menu
:JP_AdditionalFiles_SomeStep2_C3_Add_Part1
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep2_C3_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_BASEGAME%"
:JP_AdditionalFiles_SomeStep2_C3_Add_Part2
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep2_C3_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_ANIMATRONICS%"
:JP_AdditionalFiles_SomeStep2_C3_Add_Part3
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep2_C3_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_ARCANA%"
:JP_AdditionalFiles_SomeStep2_C3_Add_Part4
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep2_C3_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_DINOMOD%"
:JP_AdditionalFiles_SomeStep2_C3_Add_Part5
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep2_C3_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_EXTENDEDBUILDINGS%"
:JP_AdditionalFiles_SomeStep2_C3_Add_Part6
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep2_C3_Add
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_EXPLODED_PARKSRECBUILDINGS%"
:JP_AdditionalFiles_SomeStep2_C3_Remove
if exist "%VAR_FLOW_USING_EXPLODED_BASEGAME%\" rd /s /q "%VAR_FLOW_USING_EXPLODED_BASEGAME%" >NUL
if exist "%VAR_FLOW_USING_EXPLODED_OMRB%\" rd /s /q "%VAR_FLOW_USING_EXPLODED_OMRB%" >NUL
if exist "%VAR_FLOW_USING_EXPLODED_ANIMATRONICS%\" rd /s /q "%VAR_FLOW_USING_EXPLODED_ANIMATRONICS%" >NUL
if exist "%VAR_FLOW_USING_EXPLODED_ARCANA%\" rd /s /q "%VAR_FLOW_USING_EXPLODED_ARCANA%" >NUL
if exist "%VAR_FLOW_USING_EXPLODED_DINOMOD%\" rd /s /q "%VAR_FLOW_USING_EXPLODED_DINOMOD%" >NUL
if exist "%VAR_FLOW_USING_EXPLODED_EXTENDEDBUILDINGS%\" rd /s /q "%VAR_FLOW_USING_EXPLODED_EXTENDEDBUILDINGS%" >NUL
if exist "%VAR_FLOW_USING_EXPLODED_PARKSRECBUILDINGS%\" rd /s /q "%VAR_FLOW_USING_EXPLODED_PARKSRECBUILDINGS%" >NUL
echo FALSE>"%VAR_CONF_BS_EXPLODED%"
goto JP_AdditionalFiles_SomeStep2Menu

:JP_AdditionalFiles_SomeStep2_C4_Add
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep2Menu
echo TRUE>"%VAR_CONF_BS_LOOTED%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_LOOTED_BASEGAME%"
:JP_AdditionalFiles_SomeStep2_C4_Remove
if exist "%VAR_FLOW_USING_LOOTED_BASEGAME%\" rd /s /q "%VAR_FLOW_USING_LOOTED_BASEGAME%" >NUL
echo FALSE>"%VAR_CONF_BS_LOOTED%"
goto JP_AdditionalFiles_SomeStep2Menu

:JP_AdditionalFiles_SomeStep2_C5_Add
set VAR_FLOW_JUMPPOINT=JP_AdditionalFiles_SomeStep2Menu
echo TRUE>"%VAR_CONF_BS_SHELLED%"
cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_BUSP_DIRECTORY%" "%VAR_MODPART_BS_SHELLED_BASEGAME%"
:JP_AdditionalFiles_SomeStep2_C5_Remove
if exist "%VAR_FLOW_USING_SHELLED_BASEGAME%\" rd /s /q "%VAR_FLOW_USING_SHELLED_BASEGAME%" >NUL
echo FALSE>"%VAR_CONF_BS_SHELLED%"
goto JP_AdditionalFiles_SomeStep2Menu

:JP_ReturnPoint_AdditionalFiles_SomeStep2
set VAR_FLOW_JUMPPOINT=JP_MainMenu
if exist "%VAR_FLOW_USING_COMP_ADD_DIN%" del /s /f /q "%VAR_FLOW_USING_COMP_ADD_DIN%" >NUL
if exist "%VAR_FLOW_USING_COMP_ADD_DIN_PKS%" del /s /f /q "%VAR_FLOW_USING_COMP_ADD_DIN_PKS%" >NUL
if exist "%VAR_FLOW_USING_COMP_ADD_PKS%" del /s /f /q "%VAR_FLOW_USING_COMP_ADD_PKS%" >NUL
if exist "%VAR_FLOW_USING_COMP_DIN_PKS%" del /s /f /q "%VAR_FLOW_USING_COMP_DIN_PKS%" >NUL
set /p VAR_TEMP_A=<"%VAR_CONF_MOD_ADDBANDITS%"
set /p VAR_TEMP_D=<"%VAR_CONF_MOD_DINOMOD%"
set /p VAR_TEMP_P=<"%VAR_CONF_MOD_PKSREIMAGINING%"
if "%VAR_TEMP_A%"=="TRUE" if "%VAR_TEMP_D%"=="TRUE" if "%VAR_TEMP_P%"=="TRUE" cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_COMP_DIRECTORY%" "%VAR_MODPART_COMP_ADD_DIN_PKS%"
if "%VAR_TEMP_A%"=="TRUE" if "%VAR_TEMP_D%"=="TRUE" if "%VAR_TEMP_P%"=="FALSE" cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_COMP_DIRECTORY%" "%VAR_MODPART_COMP_ADD_DIN%"
if "%VAR_TEMP_A%"=="TRUE" if "%VAR_TEMP_D%"=="FALSE" if "%VAR_TEMP_P%"=="TRUE" cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_COMP_DIRECTORY%" "%VAR_MODPART_COMP_ADD_PKS%"
if "%VAR_TEMP_A%"=="FALSE" if "%VAR_TEMP_D%"=="TRUE" if "%VAR_TEMP_P%"=="TRUE" cd /d %~dp0 & call :UnZipFile "%VAR_OUTPUT_COMP_DIRECTORY%" "%VAR_MODPART_COMP_DIN_PKS%"
more /c "%VAR_FLOW_TEXT_STEP_06%" & pause
goto JP_MainMenu
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Additional Files Menu - End = ::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Credits Menu - Begin = :::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:JP_CreditsMenu
cls
                                                            type "%VAR_SCREEN_HEAD_UPPERPART%"
                                                            echo ==      // Main Menu // Credits                                                                                      ==
                                                            type "%VAR_SCREEN_HEAD_LOWERPART%"
                                                            echo     Credits to DinoCat, GovTD, Lanceo90 and Whaley for there mods:
                                                            echo     "Add Bandits", "Animatronics", "DinoMod", "Extended Buildings" and "Parks & Recreation Building Pack"
                                                            echo.
                                                            echo     Thank you for your great work, ladies and gentlemen!
                                                            echo.
if not exist "%VAR_CREDITS_ADDBANDITS%"                     echo     ERROR! MISSING FILE FOR:
                                                            echo     [1] CREDITS TO: GovTD    - Add Bandits
if not exist "%VAR_CREDITS_ADDBANDITS%" (echo.) else if not exist "%VAR_CREDITS_ANIMATRONICS%" echo.
if not exist "%VAR_CREDITS_ANIMATRONICS%"                   echo     ERROR! MISSING FILE FOR:
                                                            echo     [2] CREDITS TO: Lanceo90 - Animatronic Monsters (V 2.0b)
if not exist "%VAR_CREDITS_ANIMATRONICS%" (echo.) else if not exist "%VAR_CREDITS_DINOMOD%" echo.
if not exist "%VAR_CREDITS_DINOMOD%"                        echo     ERROR! MISSING FILE FOR:
                                                            echo     [3] CREDITS TO: DinoCat  - DinoCataclysm Mod
if not exist "%VAR_CREDITS_DINOMOD%" (echo.) else if not exist "%VAR_CREDITS_EXTENDEDBUILDINGS%" echo.
if not exist "%VAR_CREDITS_EXTENDEDBUILDINGS%"              echo     ERROR! MISSING FILE FOR:
                                                            echo     [4] CREDITS TO: Whaley   - Extended Buildings (V1.0) - BAD MOON RISING
if not exist "%VAR_CREDITS_EXTENDEDBUILDINGS%" (echo.) else if not exist "%VAR_CREDITS_PARKSRECBUILDPACK%" echo.
if not exist "%VAR_CREDITS_PARKSRECBUILDPACK%"              echo     ERROR! MISSING FILE FOR:
                                                            echo     [5] CREDITS TO: Whaley   - Parks and Recreation Building Pack V1.0
if not exist "%VAR_CREDITS_PARKSRECBUILDPACK%"              echo.
                                                            echo     [6] BACK TO MAIN MENU
                                                            echo.
                                                            set /P VAR_CHOICE_CREDITS=- CHOOSE AN OPTION [1-6]: 
if exist "%VAR_CREDITS_ADDBANDITS%" if "%VAR_CHOICE_CREDITS%"=="1" goto JP_ShowCredits
if exist "%VAR_CREDITS_ANIMATRONICS%" if "%VAR_CHOICE_CREDITS%"=="2" goto JP_ShowCredits
if exist "%VAR_CREDITS_DINOMOD%" if "%VAR_CHOICE_CREDITS%"=="3" goto JP_ShowCredits
if exist "%VAR_CREDITS_EXTENDEDBUILDINGS%" if "%VAR_CHOICE_CREDITS%"=="4" goto JP_ShowCredits
if exist "%VAR_CREDITS_PARKSRECBUILDPACK%" if "%VAR_CHOICE_CREDITS%"=="5" goto JP_ShowCredits
if "%VAR_CHOICE_CREDITS%"=="6" goto JP_MainMenu
goto JP_CreditsMenu

:JP_ShowCredits
if "%VAR_CHOICE_CREDITS%"=="1" set VAR_SHOWFILE=%VAR_CREDITS_ADDBANDITS%
if "%VAR_CHOICE_CREDITS%"=="2" set VAR_SHOWFILE=%VAR_CREDITS_ANIMATRONICS%
if "%VAR_CHOICE_CREDITS%"=="3" set VAR_SHOWFILE=%VAR_CREDITS_DINOMOD%
if "%VAR_CHOICE_CREDITS%"=="4" set VAR_SHOWFILE=%VAR_CREDITS_EXTENDEDBUILDINGS%
if "%VAR_CHOICE_CREDITS%"=="5" set VAR_SHOWFILE=%VAR_CREDITS_PARKSRECBUILDPACK%
if not exist "%VAR_SHOWFILE%" goto JP_ErrorMissingFile
more /c "%VAR_SHOWFILE%" & pause
goto JP_CreditsMenu
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Credits Menu - End = :::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Exit Menu - Begin = ::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:JP_ExitMenu
cls
                                                            type "%VAR_SCREEN_HEAD_UPPERPART%"
                                                            echo ==      // Main Menu // Exit                                                                                         ==
                                                            type "%VAR_SCREEN_HEAD_LOWERPART%"
                                                            echo     You want to leave?
                                                            echo.
                                                            echo     [Y] YES
                                                            echo     [N] NO
                                                            echo.
                                                            set /P VAR_CHOICE_EXIT=- CHOOSE AN OPTION [Y/N]: 
if "%VAR_CHOICE_EXIT%"=="Y" goto JP_EndOfFile
if "%VAR_CHOICE_EXIT%"=="y" goto JP_EndOfFile
if "%VAR_CHOICE_EXIT%"=="N" goto JP_MainMenu
if "%VAR_CHOICE_EXIT%"=="n" goto JP_MainMenu
goto JP_ExitMenu
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Exit Menu - End = ::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Error - Missing file - Begin = :::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:JP_ErrorMissingFile
more /c "%VAR_FLOW_TEXT_ERROR_FILEMISSING%" & pause
exit
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Error - Missing file - End = :::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Unzip - Begin = ::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /s /f /q %vbs% >NUL
>%vbs% echo set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo if not fso.FolderExists(%1) then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo end if
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo set fso = Nothing
>>%vbs% echo set objShell = Nothing
cscript //nologo %vbs% >NUL
if exist %vbs% del /s /f /q %vbs% >NUL
goto %VAR_FLOW_JUMPPOINT%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: = Unzip - End = ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::





::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                                                                  ::
:: = End Script = ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                                                                  ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:JP_EndOfFile
more /c "%VAR_FLOW_TEXT_OUTRO%" & pause
exit
