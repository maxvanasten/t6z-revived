main()
{
		func = GetFunction( "maps/mp/zm_alcatraz_utility", "check_solo_status" );

		if ( !isDefined( func ) )
		{
			func = GetFunction( "maps/mp/zm_tomb_utility", "check_solo_status" );
		}

		if ( isDefined( func ) )
		{
			replaceFunc( func, ::check_solo_status_override, 1 );
		}
}

check_solo_status_override()
{
	level.is_forever_solo_game = true;
}