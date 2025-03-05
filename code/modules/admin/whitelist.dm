/* Bluemoon edit -  Reload whitelist when changed
Original:
#ifdef TESTSERVER
	#define WHITELISTFILE	"[global.config.directory]/roguetown/wl_test.txt"
#else
	#define WHITELISTFILE	"[global.config.directory]/whitelist.txt"
#endif
*/
#define WHITELISTFILE	"[global.config.directory]/whitelist.txt"

GLOBAL_LIST_EMPTY(whitelist)
GLOBAL_PROTECT(whitelist)

// Bluemoon edit -  Reload whitelist when changed
var/whitelist_modtime = 0
/proc/load_whitelist()
	// Bluemoon edit -  Reload whitelist when changed
	whitelist_modtime = ftime(WHITELISTFILE)
	GLOB.whitelist = list()
	for(var/line in world.file2list(WHITELISTFILE))
		if(!line)
			continue
		if(findtextEx(line,"#",1,2))
			continue
		GLOB.whitelist += ckey(line)

/proc/check_whitelist(ckey)
	// Bluemoon edit -  Reload whitelist when changed
	if(ftime(WHITELISTFILE) != whitelist_modtime)
		load_whitelist()
	if(!GLOB.whitelist)
		return FALSE
	return (ckey in GLOB.whitelist)
#undef WHITELISTFILE
