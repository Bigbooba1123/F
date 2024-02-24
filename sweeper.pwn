//-------------------- SWEEPER WITH OBJECT ---------------//
#define FILTERSCRIPT

#include <a_samp>

#undef MAX_PLAYERS
#define MAX_PLAYERS	1000

#include <core>
#include <float>
#include <streamer>
//------------------- CONFIGURATIONS --------------//
#define V1POS -2279.4219,163.8151,34.8892,270.7641
#define V2POS -2279.4861,166.8218,34.8892,270.4796
#define V3POS -2279.4253,170.3831,34.8892,269.0753

#define CP1 -2265.9385,165.6452,34.8892
#define CP2 -2255.9619,85.2470,34.8970
#define CP3 -2261.0815,-43.8741,34.8969
#define CP4 -2346.7971,-67.9156,34.8892
#define CP5 -2368.9333,21.4292,34.8970
#define CP6 -2274.8533,47.1500,34.8892
#define CP7 -2249.5286,110.3769,34.8970
#define CP8 -2265.1094,170.7058,34.8892

#define SALARY 15000
//-------------------------- -----------------------//
new SweeperVeh[3];
new SweeperCPRoute[MAX_PLAYERS];
new SavingVehID[MAX_PLAYERS];
new STREAMER_TAG_OBJECT:TrashObjid[MAX_PLAYERS];
new STREAMER_TAG_RACE_CP:SweeperRCP[MAX_PLAYERS];
//-------------------------- -----------------------//

IsASweeperVeh(vehicleid)
{
    for(new x; x < 3; x++)
    {
        if(vehicleid == SweeperVeh[x])
        {
            return true;
        }
    }
    return false;
}

public OnFilterScriptInit()
{
    SweeperVeh[0] = AddStaticVehicleEx(574, V1POS, 1, 1, 60000, false); //untuk membuat kendaraan ada di server dengan ID kendaraan yang tertera
    SweeperVeh[1] = AddStaticVehicleEx(574, V2POS, 1, 1, 60000, false);
    SweeperVeh[2] = AddStaticVehicleEx(574, V3POS, 1, 1, 60000, false);

    for(new x; x < 3; x++)
    {
        SetVehicleHealth(SweeperVeh[x], 1000.00);
        SetVehicleToRespawn(SweeperVeh[x]);
    }
    return 1;
}

public OnPlayerConnect(playerid)
{
    SweeperCPRoute[playerid] = 0;
    SavingVehID[playerid] = INVALID_VEHICLE_ID;
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    SweeperCPRoute[playerid] = 0;
    SavingVehID[playerid] = INVALID_VEHICLE_ID;
    return 1;
}

public OnFilterScriptExit()
{
    return 1;
}

public OnPlayerEnterDynamicRaceCP(playerid, STREAMER_TAG_RACE_CP:checkpointid)
{
    if(checkpointid == SweeperRCP[playerid])
    {
        switch(SweeperCPRoute[playerid])
        {
            case 1:
            {
                if(DestroyDynamicObject(TrashObjid[playerid]))
                    TrashObjid[playerid] = STREAMER_TAG_OBJECT: INVALID_STREAMER_ID;

                if(DestroyDynamicRaceCP(SweeperRCP[playerid]))
                    SweeperRCP[playerid] = STREAMER_TAG_RACE_CP: INVALID_STREAMER_ID;

                SweeperCPRoute[playerid] = 2;

                TrashObjid[playerid] = CreateDynamicObject(2674, CP2, 0.0, 0.0, 0.0, 0, 0, playerid, 300.00, 300.00, -1);
                SweeperRCP[playerid] = CreateDynamicRaceCP(0, CP2, CP3, 5.0, 0, 0, playerid, 6000.00, -1, 0);
            }
            case 2:
            {
                if(DestroyDynamicObject(TrashObjid[playerid]))
                    TrashObjid[playerid] = STREAMER_TAG_OBJECT: INVALID_STREAMER_ID;

                if(DestroyDynamicRaceCP(SweeperRCP[playerid]))
                    SweeperRCP[playerid] = STREAMER_TAG_RACE_CP: INVALID_STREAMER_ID;

                SweeperCPRoute[playerid] = 3;

                TrashObjid[playerid] = CreateDynamicObject(2674, CP3, 0.0, 0.0, 0.0, 0, 0, playerid, 300.00, 300.00, -1);
                SweeperRCP[playerid] = CreateDynamicRaceCP(0, CP3, CP4, 5.0, 0, 0, playerid, 6000.00, -1, 0);
                Streamer_Update(playerid, -1);
            }
            case 3:
            {
                if(DestroyDynamicObject(TrashObjid[playerid]))
                    TrashObjid[playerid] = STREAMER_TAG_OBJECT: INVALID_STREAMER_ID;

                if(DestroyDynamicRaceCP(SweeperRCP[playerid]))
                    SweeperRCP[playerid] = STREAMER_TAG_RACE_CP: INVALID_STREAMER_ID;

                SweeperCPRoute[playerid] = 4;

                TrashObjid[playerid] = CreateDynamicObject(2674, CP4, 0.0, 0.0, 0.0, 0, 0, playerid, 300.00, 300.00, -1);
                SweeperRCP[playerid] = CreateDynamicRaceCP(0, CP4, CP5, 5.0, 0, 0, playerid, 6000.00, -1, 0);
                Streamer_Update(playerid, -1);
            }
            case 4:
            {
                if(DestroyDynamicObject(TrashObjid[playerid]))
                    TrashObjid[playerid] = STREAMER_TAG_OBJECT: INVALID_STREAMER_ID;

                if(DestroyDynamicRaceCP(SweeperRCP[playerid]))
                    SweeperRCP[playerid] = STREAMER_TAG_RACE_CP: INVALID_STREAMER_ID;

                SweeperCPRoute[playerid] = 5;

                TrashObjid[playerid] = CreateDynamicObject(2674, CP5, 0.0, 0.0, 0.0, 0, 0, playerid, 300.00, 300.00, -1);
                SweeperRCP[playerid] = CreateDynamicRaceCP(0, CP5, CP6, 5.0, 0, 0, playerid, 6000.00, -1, 0);
                Streamer_Update(playerid, -1);
            }
            case 5:
            {
                if(DestroyDynamicObject(TrashObjid[playerid]))
                    TrashObjid[playerid] = STREAMER_TAG_OBJECT: INVALID_STREAMER_ID;

                if(DestroyDynamicRaceCP(SweeperRCP[playerid]))
                    SweeperRCP[playerid] = STREAMER_TAG_RACE_CP: INVALID_STREAMER_ID;

                SweeperCPRoute[playerid] = 6;

                TrashObjid[playerid] = CreateDynamicObject(2674, CP6, 0.0, 0.0, 0.0, 0, 0, playerid, 300.00, 300.00, -1);
                SweeperRCP[playerid] = CreateDynamicRaceCP(0, CP6, CP7, 5.0, 0, 0, playerid, 6000.00, -1, 0);
                Streamer_Update(playerid, -1);
            }
            case 6:
            {
                if(DestroyDynamicObject(TrashObjid[playerid]))
                    TrashObjid[playerid] = STREAMER_TAG_OBJECT: INVALID_STREAMER_ID;

                if(DestroyDynamicRaceCP(SweeperRCP[playerid]))
                    SweeperRCP[playerid] = STREAMER_TAG_RACE_CP: INVALID_STREAMER_ID;

                SweeperCPRoute[playerid] = 7;

                TrashObjid[playerid] = CreateDynamicObject(2674, CP7, 0.0, 0.0, 0.0, 0, 0, playerid, 300.00, 300.00, -1);
                SweeperRCP[playerid] = CreateDynamicRaceCP(0, CP7, CP8, 5.0, 0, 0, playerid, 6000.00, -1, 0);
                Streamer_Update(playerid, -1);
            }
            case 7:
            {
                if(DestroyDynamicObject(TrashObjid[playerid]))
                    TrashObjid[playerid] = STREAMER_TAG_OBJECT: INVALID_STREAMER_ID;

                if(DestroyDynamicRaceCP(SweeperRCP[playerid]))
                    SweeperRCP[playerid] = STREAMER_TAG_RACE_CP: INVALID_STREAMER_ID;

                SweeperCPRoute[playerid] = 8;

                TrashObjid[playerid] = CreateDynamicObject(2674, CP8, 0.0, 0.0, 0.0, 0, 0, playerid, 300.00, 300.00, -1);
                SweeperRCP[playerid] = CreateDynamicRaceCP(0, CP8, CP8, 5.0, 0, 0, playerid, 6000.00, -1, 0);
                Streamer_Update(playerid, -1);
            }
            case 8:
            {
                if(DestroyDynamicObject(TrashObjid[playerid]))
                    TrashObjid[playerid] = STREAMER_TAG_OBJECT: INVALID_STREAMER_ID;

                if(DestroyDynamicRaceCP(SweeperRCP[playerid]))
                    SweeperRCP[playerid] = STREAMER_TAG_RACE_CP: INVALID_STREAMER_ID;

                SweeperCPRoute[playerid] = 0;

                GivePlayerMoney(playerid, SALARY);
            }
        }
    }
    return 1;
}

public OnPlayerLeaveDynamicRaceCP(playerid, STREAMER_TAG_RACE_CP:checkpointid)
{
    return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER) //naik (dari jalan kaki -> driver)
    {
        SavingVehID[playerid] = GetPlayerVehicleID(playerid);
        if(IsASweeperVeh(GetPlayerVehicleID(playerid)))
        {
            if(DestroyDynamicObject(TrashObjid[playerid]))
                TrashObjid[playerid] = STREAMER_TAG_OBJECT: INVALID_STREAMER_ID;

            if(DestroyDynamicRaceCP(SweeperRCP[playerid]))
                SweeperRCP[playerid] = STREAMER_TAG_RACE_CP: INVALID_STREAMER_ID;

            SweeperCPRoute[playerid] = 1;

            TrashObjid[playerid] = CreateDynamicObject(2674, CP1, 0.0, 0.0, 0.0, 0, 0, playerid, 300.00, 300.00, -1);
            SweeperRCP[playerid] = CreateDynamicRaceCP(0, CP1, CP2, 5.0, 0, 0, playerid, 300.00, -1, 0);
            GameTextForPlayer(playerid, "~g~Sweeper Sidejob Mulai!", 5000, 3);
        }
    }
    else if(oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_ONFOOT) //turun (dari jalan driver -> kaki)
    {
        if(DestroyDynamicObject(TrashObjid[playerid]))
            TrashObjid[playerid] = STREAMER_TAG_OBJECT: INVALID_STREAMER_ID;

        if(DestroyDynamicRaceCP(SweeperRCP[playerid]))
            SweeperRCP[playerid] = STREAMER_TAG_RACE_CP: INVALID_STREAMER_ID;

        SetVehicleToRespawn(SavingVehID[playerid]);
        GameTextForPlayer(playerid, "~r~MISSION FAILED!", 5000, 3);
    }
    return 1;
}