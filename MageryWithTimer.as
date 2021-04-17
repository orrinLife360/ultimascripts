ocv808
#0290

cyrus — Yesterday at 11:55 PM
klops — Yesterday at 11:55 PM
you wanted a gamer? gamer here now
cyrus — Yesterday at 11:55 PM
Real gamer here now
help me with the game
Stump — Today at 7:51 AM

Stump — Today at 8:07 AM

I’m making my damn sailor today

I consistently see Cromwell out there getting shit on
ocv808 — Today at 9:10 AM

I started my mage/summoner last night. Should I go noxx to be the ultimate boat slayer?
Stump — Today at 9:15 AM
ayaya
ummm
ocv808 — Today at 9:15 AM
Or just stick with plain ole void
I can always transition later
Stump — Today at 9:15 AM
can you go nox template w/ void set?
im not sure why poison mage is good on boats yet
so i'd stick w/ void for now
void seems all around real good
ocv808 — Today at 9:22 AM
Yeah if we really get deeper in boating maybe I can go that way.
Poison armor aspect is good on boating because the chance to spread poison
Pretty much the whole boat gets noxxed
And the tanky elementals just take all the damage for your crew
Stump — Today at 9:23 AM
aahhhhh
ocv808 — Today at 9:23 AM
Seems like a lot of people do poison weapon/void armor
Stump — Today at 9:23 AM
we're gonna get fucked on a boat for the first few times
it'll be good
ocv808 — Today at 9:23 AM
Turbo fucked
Stump — Today at 9:23 AM
absolutely
some salty sea dogs out there
ocv808 — Today at 9:24 AM
Yaaa
I guess if you chose a certain flag you get your boat back if you die.
Stump — Today at 9:24 AM
thank jebus
ocv808 — Today at 9:25 AM
But you lose it if you attack first on another player boat
And go pirate
:parrot:
Stump — Today at 9:25 AM
oooooooo
:pirate_flag:
i like the fact our extremely wealthy neighbor
keeps showing up in the #boats channel
dead on his boat
ocv808 — Today at 9:26 AM
Lol
Was reading boats and it's a highly active community
Stump — Today at 9:26 AM
oh yeah
goddamn my hands are so cold
i can't even discuss boats
fuCUK
ocv808 — Today at 9:27 AM
Ahhhb
Stump — Today at 10:16 AM
// This script requires a bit of set up
//
// You require the following:
// 1. A rune to your walrus location in your bag (walrusRune)
// 2. A rune to your bank location in your bag (you want to recall back to the bank right next to your healer) (reagentLocationRune)
// 3. A 'rereg' organizer agent that will pull 20 of each reagent into your reagent bag
// 4. A bag of reagents in your bank (regbag)
// 5. A friend that is healing you as you wrestle them (optional) (friend1)
// 6. The following counters for reagents set up in UOSteam:
//    sulfur, blackpearl, bloodmoss, mandrake, silk, nightshade
// 7. A banker that we'll use to open the bag and run the rereg agent
//
// This script will recall in to the walrus location and EBolt a walrus until it's dead if you're sub-80 magery.  Post-80 you will FS.
// 
// YOU CAN DIE IF YOU'RE RUNNING A TEMPLATE WITHOUT WRESTLING.  THE WALRUS WILL BEAT YOU UP.  
// It's still possible to use this script, but I recommend ~20 wrestling and leather armor
//
// You may drop the magery threshold to start casting earth elemental from 86 to 80 if you're a wealthy person!

// Person we will making sure isn't dying
if not findalias 'friend1'
  sysmsg 'Select friend'
  promptalias 'friend1'
endif

if not findalias regbag
  sysmsg 'Select your reagent bag'
  promptalias regbag
endif

// Sanity check for rereg organizer
sysmsg 'Grabbing starting reagents'
useobject regbag
pause 751
organizer rereg
while organizing
  pause 1001
endwhile

// Check flamestrike reagents
sysmsg 'Checking flamestrike reagents'
if counter 'silk' == 0
  sysmsg 'Can not proceed without spiders silk. Ending'
  stop
elseif counter 'sulfur' == 0
  sysmsg 'Can not proceed without sulfurous ash. Ending'
  stop
endif
// Any failure above means something's wrong w/ your reagent situation

// This assume we start next to our sparring partner
// Main loop
while not dead

  // Bonus is active loop
  // We assume we're in a house and next to the reagent bag and our sparring partner
  // This loop performs the following actions:
  // 1. Checks our partner's health to stop sparring if necessary
  // 2. Checks our own health to indicate that we're dying to our partner
  // 3. Casts flamestrike on ourself for GAINS 
  // 4. Walks away to meditate if necessary
  // 5. Restock reagents

  // 1. Partner health check
  if not @findlayer 'friend1' 6
    warmode 'off'
    pause 2000
  else
    attack 'friend1'
  endif

  // 2. Self health check
  if hits < 60
    pause 650
    @findlayer 'self' 6
    moveitem 'found' 'backpack' 46 65 0
    pause 650

    // Med up if necessary
    if mana < 50
      warmode 'off'
      pause 650
      warmode 'on'
      pause 650
      warmode 'off'
      pause 1000
      useskill 'meditation'
      while mana < 50
      endwhile
    endif

    // Raise eval while waiting for a heal
    while hits < 60

      // If our friend starts dying while we're waiting for a heal
      // pause attacking a moment but continue to check our own health
      // to put our own hat back on.  Avoids edge case where neither particiant will
      // put hat back on
      if not @findlayer 'friend1' 6
        warmode 'off'
... (134 lines left)
Collapse
message.txt
7 KB
﻿
// This script requires a bit of set up
//
// You require the following:
// 1. A rune to your walrus location in your bag (walrusRune)
// 2. A rune to your bank location in your bag (you want to recall back to the bank right next to your healer) (reagentLocationRune)
// 3. A 'rereg' organizer agent that will pull 20 of each reagent into your reagent bag
// 4. A bag of reagents in your bank (regbag)
// 5. A friend that is healing you as you wrestle them (optional) (friend1)
// 6. The following counters for reagents set up in UOSteam:
//    sulfur, blackpearl, bloodmoss, mandrake, silk, nightshade
// 7. A banker that we'll use to open the bag and run the rereg agent
//
// This script will recall in to the walrus location and EBolt a walrus until it's dead if you're sub-80 magery.  Post-80 you will FS.
// 
// YOU CAN DIE IF YOU'RE RUNNING A TEMPLATE WITHOUT WRESTLING.  THE WALRUS WILL BEAT YOU UP.  
// It's still possible to use this script, but I recommend ~20 wrestling and leather armor
//
// You may drop the magery threshold to start casting earth elemental from 86 to 80 if you're a wealthy person!

// Person we will making sure isn't dying
if not findalias 'friend1'
  sysmsg 'Select friend'
  promptalias 'friend1'
endif

if not findalias regbag
  sysmsg 'Select your reagent bag'
  promptalias regbag
endif

// Sanity check for rereg organizer
sysmsg 'Grabbing starting reagents'
useobject regbag
pause 751
organizer rereg
while organizing
  pause 1001
endwhile

// Check flamestrike reagents
sysmsg 'Checking flamestrike reagents'
if counter 'silk' == 0
  sysmsg 'Can not proceed without spiders silk. Ending'
  stop
elseif counter 'sulfur' == 0
  sysmsg 'Can not proceed without sulfurous ash. Ending'
  stop
endif
// Any failure above means something's wrong w/ your reagent situation

// This assume we start next to our sparring partner
// Main loop
while not dead

  // Bonus is active loop
  // We assume we're in a house and next to the reagent bag and our sparring partner
  // This loop performs the following actions:
  // 1. Checks our partner's health to stop sparring if necessary
  // 2. Checks our own health to indicate that we're dying to our partner
  // 3. Casts flamestrike on ourself for GAINS 
  // 4. Walks away to meditate if necessary
  // 5. Restock reagents

  // 1. Partner health check
  if not @findlayer 'friend1' 6
    warmode 'off'
    pause 2000
  else
    attack 'friend1'
  endif

  // 2. Self health check
  if hits < 60
    pause 650
    @findlayer 'self' 6
    moveitem 'found' 'backpack' 46 65 0
    pause 650

    // Med up if necessary
    if mana < 50
      warmode 'off'
      pause 650
      warmode 'on'
      pause 650
      warmode 'off'
      pause 1000
      useskill 'meditation'
      while mana < 50
      endwhile
    endif

    // Raise eval while waiting for a heal
    while hits < 60

      // If our friend starts dying while we're waiting for a heal
      // pause attacking a moment but continue to check our own health
      // to put our own hat back on.  Avoids edge case where neither particiant will
      // put hat back on
      if not @findlayer 'friend1' 6
        warmode 'off'
        pause 650
        warmode 'on'
        pause 650
        warmode 'off'
        useskill 'meditation'
        pause 600

        // Put our hat back on since we're fine
        if hits > 59
          @findtype 0x1718 'any' 'backpack'
          equipitem 'found' 6
          pause 600
        endif
      endif
      // Too lazy to optimize this right now from my bed
      // Can probably remove above hat code and just use the blow
      // Put our hat back on since we're fine
      if hits > 59
        @findtype 0x1718 'any' 'backpack'
        equipitem 'found' 6
        pause 600
      endif
    endwhile

    // Put hat back on once we're fine
    if hits > 59
      @findtype 0x1718 'any' 'backpack'
      equipitem 'found' 6
      pause 600
    endif
  endif

  // 3. Magery gains
  clearjournal 
  pause 650
  if skill 'magery' < 86
    autotargetself
    cast 'flame strike'
    pause 4001
  else
    cast 'Summon Earth Elemental'
    pause 6100
    msg 'an earth elemental release'
    pause 1000
  endif

  // 4. Mana check
  // Don't med if we're below threshold for healing
  // We will remove hat on next runloop and start to med
  // This makes sure we med up while our healer heals us
  if mana < 50
    if hits < 60
      pause 650
      @findlayer 'self' 6
      moveitem 'found' 'backpack' 46 65 0
      pause 650
    else
      // Put our hat back on since we're fine
      @findtype 0x1718 'any' 'backpack'
      equipitem 'found' 6
      pause 600
    endif
    warmode 'off'
    pause 650
    warmode 'on'
    pause 650
    warmode 'off'
    pause 1000
    useskill 'meditation'
    while mana < 50
    endwhile
    pause 600
  else 
    // attack 'friend1'
  endif

  // 5. Reagent Check
  // Some of these checks will be redundant
  // Check Flamestrike reagents
  sysmsg 'Checking flamestrike reagents'
  if counter 'silk' == 0
    sysmsg 'Restocking'
    useobject regbag
    pause 751
    waitforcontext banker 1 15000
    pause 751
    organizer rereg
    while organizing
      pause 1001
    endwhile
  elseif counter 'sulfur' == 0
    useobject regbag
    pause 751
    waitforcontext banker 1 15000
    pause 751
    organizer rereg
    while organizing
      pause 1001
    endwhile
  endif

  // Check Earth Elemental Reagents
  sysmsg 'Checking earth elemental reagents'
  if counter 'silk' == 0
    sysmsg 'Restocking'
    useobject regbag
    pause 751
    waitforcontext banker 1 15000
    pause 751
    organizer rereg
    while organizing
      pause 1001
    endwhile
  elseif counter 'bloodmoss' == 0
    useobject regbag
    pause 751
    waitforcontext banker 1 15000
    pause 751
    organizer rereg
    while organizing
      pause 1001
    endwhile
  elseif counter 'mandrake' == 0
    useobject regbag
    pause 751
    waitforcontext banker 1 15000
    pause 751
    organizer rereg
    while organizing
      pause 1001
    endwhile
  endif

endwhile
message.txt
7 KB
