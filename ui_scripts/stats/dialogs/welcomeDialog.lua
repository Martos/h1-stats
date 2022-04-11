function welcome_stats_popup( f15_arg0, f15_arg1 )
    return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		cancel_will_close = false,
		popup_title = welcomePopUpAll[language][1],
		message_text = welcomePopUpAll[language][2],
		button_text = welcomePopUpAll[language][3],
		confirmation_action = function() end
	} )
end