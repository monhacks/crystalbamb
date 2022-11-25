const_value set 2

SafariZoneFuchsiaGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SafariZoneFuchsiaGateOfficerScript:
	jumptextfaceplayer SafariZoneFuchsiaGateOfficerText

SafariZoneFuchsiaGateOfficerText:
	text "Hi there!"

	para "The Warden is"
	line "gone, so we're not"

	para "running the Safari"
	line "Game right now."

	para "You'll have to"
	line "bring your own"

	para "Balls if you want"
	line "to catch any"
	cont "#mon."
	done

SafariZoneFuchsiaGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $0, $4, 1, SAFARI_ZONE_HUB
	warp_def $0, $5, 2, SAFARI_ZONE_HUB
	warp_def $7, $4, 7, FUCHSIA_CITY
	warp_def $7, $5, 7, FUCHSIA_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SafariZoneFuchsiaGateOfficerScript, -1
