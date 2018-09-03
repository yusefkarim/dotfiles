/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nogroup";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#1A1A1A",   /* during input */
	[FAILED] = "#B62A25",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
