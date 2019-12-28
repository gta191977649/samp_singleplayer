/*
	Single-Player Info Boxes ~ Kevin-Reinke

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#if defined _spib_included
	#endinput
#endif

#define _spib_included

// ** VARIABLES

// *** PER-PLAYER VARIABLES

// **** TIMERS

static ptmInfoBox[MAX_PLAYERS];

// **** TEXTDRAWS

static PlayerText:ptdInfoBox[MAX_PLAYERS];

// ** CALLBACKS

public OnPlayerConnect(playerid)
{
	ptdInfoBox[playerid] = CreatePlayerTextDraw(playerid, 38.000000, 132.000000, "");
	PlayerTextDrawBackgroundColor(playerid, ptdInfoBox[playerid], 255);
	PlayerTextDrawFont(playerid, ptdInfoBox[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ptdInfoBox[playerid], 0.429999, 1.400000);
	PlayerTextDrawColor(playerid, ptdInfoBox[playerid], -1);
	PlayerTextDrawSetOutline(playerid, ptdInfoBox[playerid], 0);
	PlayerTextDrawSetProportional(playerid, ptdInfoBox[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ptdInfoBox[playerid], 1);
	PlayerTextDrawUseBox(playerid, ptdInfoBox[playerid], 1);
	PlayerTextDrawBoxColor(playerid, ptdInfoBox[playerid], 255);
	PlayerTextDrawTextSize(playerid, ptdInfoBox[playerid], 219.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, ptdInfoBox[playerid], 0);

	#if defined spib_OnPlayerConnect
		return spib_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#define OnPlayerConnect spib_OnPlayerConnect

#if defined spib_OnPlayerConnect
	forward spib_OnPlayerConnect(playerid);
#endif

// ** FUNCTIONS

stock ShowInfoBox(playerid, box_color, shown_for, text[])
{
	PlayerTextDrawBoxColor(playerid, ptdInfoBox[playerid], box_color);
	PlayerTextDrawSetString(playerid, ptdInfoBox[playerid], text);
	PlayerTextDrawShow(playerid, ptdInfoBox[playerid]);
	PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
	
	KillTimer(ptmInfoBox[playerid]);
	ptmInfoBox[playerid] = SetTimerEx("HideInfoBox", (1000 * shown_for), false, "i", playerid);
	return 1;
}

forward HideInfoBox(playerid);
public HideInfoBox(playerid)
{
	PlayerTextDrawHide(playerid, ptdInfoBox[playerid]);
	return 1;
}
