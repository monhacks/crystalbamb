	object_const_def
	const ROUTE4_YOUNGSTER
	const ROUTE4_LASS1
	const ROUTE4_LASS2
	const ROUTE4_POKE_BALL

Route4_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, Route4callback

Route4callback:
	checkevent EVENT_USED_ROOF_KEY
	iftrue .UnlockCave
	endcallback

.UnlockCave:
	changeblock 38, 3, $06 ; locked door
	endcallback

RoofDoorScript::
	opentext
	checkevent EVENT_USED_ROOF_KEY
	iftrue .Open
	checkitem ROOF_KEY
	iftrue .Unlock
	writetext TheDoorsLockedText
	waitbutton
	closetext
	end

.Unlock:
	writetext TheDoorsLockedText1
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_STRENGTH
	earthquake 30
	pause 20
	writetext KeyOpenedDoorText
	waitbutton
	closetext
	changeblock 38, 3, $06 ; unlocked door
	reloadmappart
	closetext
	setevent EVENT_USED_ROOF_KEY
	end

.Open:
	closetext
	end

TheDoorsLockedText:
	text "There' s a small"
	line "indent in the wall…"
	done

TheDoorsLockedText1:
	text "There' s a small"
	line "indent in the wall…"

	para "The OLD MAP indica-"
	line "tes a CAVE here…"
	
	done


KeyOpenedDoorText:
	text "The wall collapsed!"
	line "Discovered a small"
	cont "cavern!"
	done



TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

CeruleanCaveSign:
    jumptext CeruleanCaveSignText

Route4HPUp:
	itemball HP_UP

Route4HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

BirdKeeperHankSeenText:
	text "I'm raising my"
	line "#MON. Want to"
	cont "battle with me?"
	done

BirdKeeperHankBeatenText:
	text "Ack! I lost that"
	line "one…"
	done

BirdKeeperHankAfterBattleText:
	text "If you have a"
	line "specific #MON"

	para "that you want to"
	line "raise, put it out"

	para "first, then switch"
	line "it right away."

	para "That's how to do"
	line "it."
	done

PicnickerHopeSeenText:
	text "I have a feeling"
	line "that I can win."

	para "Let's see if I'm"
	line "right!"
	done

PicnickerHopeBeatenText:
	text "Aww, you are too"
	line "strong."
	done

PicnickerHopeAfterBattleText:
	text "I heard CLEFAIRY"
	line "appear at MT.MOON."

	para "But where could"
	line "they be?"
	done

PicnickerSharonSeenText:
	text "Um…"
	line "I…"
	done

PicnickerSharonBeatenText:
	text "…"
	done

PicnickerSharonAfterBattleText:
	text "……I'll go train"
	line "some more…"
	done

MtMoonSquareSignText:
	text "MT.MOON SQUARE"

	para "Just go up the"
	line "stairs."
	done

CeruleanCaveSignText:
	text "CERULEAN CAVE"

	para "Definition of"
	line "vicious, was once"
	para "accessible from"
	line "here…"
	done


Route4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, MOUNT_MOON, 2
	warp_event 38,  3, CERULEAN_CAVE_1F, 1

	def_coord_events

	def_bg_events
	bg_event 38,  3, BGEVENT_READ, RoofDoorScript
	bg_event  5,  7, BGEVENT_READ, MtMoonSquareSign
	bg_event 10,  3, BGEVENT_ITEM, Route4HiddenUltraBall
	bg_event 39,  5, BGEVENT_READ, CeruleanCaveSign

	def_object_events
	object_event 17,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperHank, -1
	object_event  9,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerHope, -1
	object_event 21,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	object_event 26,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route4HPUp, EVENT_ROUTE_4_HP_UP
	