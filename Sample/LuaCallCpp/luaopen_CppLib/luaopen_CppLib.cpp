// luaopen_CppLib.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
#include "lua.hpp"

/////////////////////////////
//test function
/////////////////////////////
extern "C" int add(lua_State * L)
{
	double leftData = luaL_checknumber(L,1);
	double rightData = luaL_checknumber(L,2);
	lua_pushnumber(L,leftData + rightData);
	return 1;
}

extern "C" int ShowMsgBox(lua_State * state)
{
	const char* inputstring = luaL_checkstring(state,1);

	//将const char*转化为LPCTSTR
	int length = sizeof(TCHAR)*(strlen(inputstring) + 1);
	LPTSTR tcBuffer = new TCHAR[length];
	memset(tcBuffer, 0, length);
	MultiByteToWideChar(CP_ACP, 0, inputstring, strlen(inputstring), tcBuffer, length);
	LPCTSTR  pDest = (LPCTSTR)tcBuffer; 

	int res = MessageBox(NULL, L"input value here to c++ msgBox's title", pDest, MB_YESNOCANCEL);
	//lua_pushnumber(L,leftData + rightData);
	switch (res)	
	{
	case 2:	//cancel
		lua_pushstring(state,"clicked cancel button");
		break;
	case 6:	//yes
		lua_pushstring(state,"clicked yes button");
		break;
	case 7:	//no
		lua_pushstring(state,"clicked no button");
		break;
	default:
		lua_pushstring(state,"clicked inputWrongData button");
	}
	return 1;
}
static luaL_Reg libs[] = {
	{ "ShowMsgBox", ShowMsgBox },
	{"add" , add},	//....
	{NULL , NULL}	//end function list
};

extern "C" __declspec(dllexport)
int luaopen_CppLibForLua(lua_State * L)
{
	//luaL_checkversion(L);
	//luaL_newlib(L,libs);

	lua_newtable(L);
	luaL_setfuncs(L,  libs,0);
	//lua_newtable(L);
	//luaL_setfuncs(L,luaopen_LuaCallCpp,0);
	return 1;
}
