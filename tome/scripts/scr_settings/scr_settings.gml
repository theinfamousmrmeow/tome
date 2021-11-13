#region Settings


function setting_set_real(_section, _key, _value) {
	ini_open("settings.ini");
	ini_write_real(_section,_key,_value);
	ini_close();
}

function setting_set_string(_section, _key, _value) {
	ini_open("settings.ini");
	ini_write_real(_section,_key,_value);
	ini_close();
}

function setting_get_real(_section,_key,_value=0) {

	ini_open("settings.ini");

	var __thing = ini_read_real(_section,_key,_value);

	ini_close();

	return __thing;
}

function setting_get_string(_section,_key,_value=0) {

	ini_open("settings.ini");

	var __thing = ini_read_real(_section,_key,_value);

	ini_close();

	return __thing;
}

#endregion
