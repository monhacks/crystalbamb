const_value set 2

SafariZoneHubRestHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SafariZoneHubRestHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 9, SAFARI_ZONE_HUB
	warp_def $7, $3, 9, SAFARI_ZONE_HUB

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
