/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int gappx     = 5;       /* gap pixel between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { 
  "CodeNewRoman Nerd Font:size=14",
  "LXGW WenKai:size=12",
  "JetBrainsMono Nerd Font:pixelsize=12",
  "Symbols Nerd Font:size=12",
  "Liberation Mono:pixelsize=12:antialias=true:autohint=true",
  "Gohu GohuFont:pixelsize=11:antialias=false:autohint=false",
};
static const char dmenufont[]       = "CodeNewRoman Nerd Font:size=12";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
// static const char col_gray3[]       = "#bbbbbb";
static const char col_gray3[]       = "#F5C2E7";
// static const char col_gray3[]       = "#FAE3B0";
// static const char col_gray4[]       = "#eeeeee";
static const char col_gray4[]       = "#1E1E2E";
// static const char col_cyan[]        = "#005577";
static const char col_cyan[]        = "#BABBF1";


static const char *colors[][3]      = {
  /*               fg         bg         border   */
  [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
  [SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
  [SchemeStatus]  = { col_gray3, col_gray1,  "#000000"  }, // Statusbar right {text,background,not used but cannot be empty}
  [SchemeTagsSel]  = { col_gray4, col_cyan,  "#000000"  }, // Tagbar left selected {text,background,not used but cannot be empty}
  [SchemeTagsNorm]  = { col_gray3, col_gray1,  "#000000"  }, // Tagbar left unselected {text,background,not used but cannot be empty}
  [SchemeInfoSel]  = { col_gray4, col_cyan,  "#000000"  }, // infobar middle  selected {text,background,not used but cannot be empty}
  [SchemeInfoNorm]  = { col_gray3, col_gray1,  "#000000"  }, // infobar middle  unselected {text,background,not used but cannot be empty}
};

/* tagging */
// static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
static const char *tags[] = {"壹","贰","叁","肆","伍","陆","柒","捌","玖","拾"};

#define TAGMASK1 (1<<0)
#define TAGMASK2 (1<<1)
#define TAGMASK3 (1<<2)
#define TAGMASK4 (1<<3)
#define TAGMASK5 (1<<4)
#define TAGMASK6 (1<<5)
#define TAGMASK7 (1<<6)
#define TAGMASK8 (1<<7)
#define TAGMASK9 (1<<8)
#define TAGMASK10 (1<<9)
#define TAGMASKALL (TAGMASK1 \
    | TAGMASK2 \
    | TAGMASK3 \
    | TAGMASK4 \
    | TAGMASK5 \
    | TAGMASK6 \
    | TAGMASK7 \
    | TAGMASK8 \
    | TAGMASK9 \
    | TAGMASK10)
static const Rule rules[] = {
  /* xprop(1):
   *	WM_CLASS(STRING) = instance, class
   *	WM_NAME(STRING) = title
   */
  /* class      	instance    title       tags mask     isfloating   monitor */
  { "Gimp",     	NULL,       NULL,       0,            1,            -1},
  { "firefox",  	NULL,       NULL,       TAGMASK8, 	  0,            -1},
  /* 騰訊會議有 bug，必須在每一頁都顯示 | wemeetapp must be gloablly on everytag or it would be crashed */
  { "wemeetapp", 	NULL,       NULL,       TAGMASKALL, 	1,            -1},
  { "QQ",         NULL,       NULL,       TAGMASK9,     1,            -1},
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
  /* symbol     arrange function */
  { "T",      tile },    /* first entry is default */
  { "F",      NULL },    /* no layout function means floating behavior */
  { "[M]",      monocle },
  { "|U|",      centeredmaster },
  { "<O>",      centeredfloatingmaster },
};

/* key definitions */
// #define MODKEY Mod1Mask
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG,cmd) \
{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
#define SHCMD_RSTATUS(cmd) SHCMD(cmd" && ~/.dwm/mystatusbar.sh")

/* helper for using custom scripts stored in custom Locations */
#define scripts_dir ~/.dwm/scripts/               // Custom Location to store scripts
#define lock_script mylockscreen.sh               // Custom Scripts for lock screen
#define screenshot_script myscreenshotapi.sh      // Custom Scripts for screen shots
#define CONCAT(x,y) #x#y
#define CONCAT2(x,y) CONCAT(x,y)                  // Cache it, or '#' would obtain 'scripts_dir'(string) instead of its value
#define FULLPATH(x) CONCAT2(scripts_dir, x)
#define CUSTOM_SCRIPTS(cmd) SHCMD(FULLPATH(cmd))

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };
// static const char *termcmd_kitty[] = { "kitty", NULL };
static const char *termcmd_terminator[] = { "terminator", NULL };


static const Key keys[] = {
  /* modifier                     key        function        argument */
  /* 打開程序啓動器 Open Rofi or dmenu */
  { MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
  { MODKEY|ShiftMask,             XK_p,      spawn,          CUSTOM_SCRIPTS(call_rofi.sh drun)},
  /* 打開終端 Open Terminal */
  { MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
  { MODKEY,             		      XK_Return, spawn,          {.v = termcmd_terminator} },
  /* 隱藏 / 展示 頂欄 */
  { MODKEY,                       XK_b,      togglebar,      {0} },
  /* 切換當前窗口 */
  { MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
  { MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
  /* 工作區內 調整當前窗口位置 */
  { MODKEY|ShiftMask,             XK_j,      pushdown,       {0} },
  { MODKEY|ShiftMask,             XK_k,      pushup,         {0} },
  /* 給主區域增加 / 減少窗口數量, 對全部工作區有效 */
  { MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
  { MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
  /* 調整當前工作區大小 */ 
  { MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
  { MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },

  { MODKEY,                       XK_Tab,    view,           {0} },
  /* 殺掉當前窗口（進程） */
  { MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
  { MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
  /* 切換不同的 layout */
  { MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
  { MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
  { MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
  { MODKEY,                       XK_u,      setlayout,      {.v = &layouts[3]} },
  { MODKEY,                       XK_o,      setlayout,      {.v = &layouts[4]} },
  { MODKEY,                       XK_space,  setlayout,      {0} },
  { MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },

  { MODKEY,                       XK_0,      view,           {.ui = ~0 } },
  { MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },

  { MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
  { MODKEY,                       XK_period, focusmon,       {.i = +1 } },
  { MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
  { MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
  /* 退出當前 dwm 且關閉所有進程 回到 tty */
  { MODKEY|ShiftMask,             XK_e,      quit,           {0} },
  /* 退出當前 dwm 然後 重新加載 dwm 並保留原有窗口（但不保證位置） */
  { MODKEY|ShiftMask, 		        XK_r, 	   quit, 	        {1} },
  // KEYS for XF86 --> Volum and Brightness
  /* pactl 控制音量 */
  {0, 		XF86XK_AudioRaiseVolume, 	spawn, SHCMD_RSTATUS("pactl set-sink-volume @DEFAULT_SINK@ +5%")},
  {0, 		XF86XK_AudioRaiseVolume, 	spawn, SHCMD_RSTATUS("pactl set-sink-volume @DEFAULT_SINK@ +5%")},
  {0, 		XF86XK_AudioLowerVolume, 	spawn, SHCMD_RSTATUS("pactl set-sink-volume @DEFAULT_SINK@ -5%")},
  {0, 		XF86XK_AudioMute, 		    spawn, SHCMD_RSTATUS("pactl set-sink-mute @DEFAULT_SINK@ toggle")},
  {0, 		XF86XK_AudioMicMute, 		  spawn, SHCMD_RSTATUS("pactl set-source-mute @DEFAULT_SOURCE@ toggle")},
  /* xbacklight 控制屏幕亮度 */
  {0,     XF86XK_MonBrightnessUp,    	spawn, SHCMD_RSTATUS("xbacklight -inc 5") },
  {0,     XF86XK_MonBrightnessDown,  	spawn, SHCMD_RSTATUS("xbacklight -dec 5") },
  /* 調用腳本進行鎖屏 */
  { MODKEY|ControlMask, 		XK_l, 		  spawn,    CUSTOM_SCRIPTS(mylockscreen.sh)},
  {0, 				              XK_Print, 	spawn, 		CUSTOM_SCRIPTS(myscreenshotapi.sh)},
  {MODKEY,                  XK_w,       spawn,    CUSTOM_SCRIPTS(wallpaper_random.sh)},
  {MODKEY,                  XK_c,       spawn,    CUSTOM_SCRIPTS(capturehighlight.sh)},
  {MODKEY,                  XK_v,       spawn,    CUSTOM_SCRIPTS(translate.sh)},
  {MODKEY,                  XK_s,       spawn,    CUSTOM_SCRIPTS(load_screen.sh)},

  /* 工作區定義 */
  /* macro    Key     tag   cmd */
  TAGKEYS(    XK_1,   0,    0)
  TAGKEYS(    XK_2,   1,    0)
  TAGKEYS(    XK_3,   2,    0)
  TAGKEYS(    XK_4,   3,    0)
  TAGKEYS(    XK_5,   4,    0)
  TAGKEYS(    XK_6,   5,    0)
  TAGKEYS(    XK_7,   6,    0)
  TAGKEYS(    XK_8,   7,    0)
  TAGKEYS(    XK_9,   8,    "~/.dwm/scripts/runqq.sh")
};


/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
  /* click                event mask      button          function        argument */
  { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
  { ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
  { ClkWinTitle,          0,              Button2,        zoom,           {0} },
  { ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
  { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
  { ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
  { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
  { ClkTagBar,            0,              Button1,        view,           {0} },
  { ClkTagBar,            0,              Button3,        toggleview,     {0} },
  { ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
  { ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

