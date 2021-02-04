#!/usr/bin/env bash
# TEL Startup file
# these commands are ran only once when a session starts
# this file will be replaced with each update so modifications are not recommended here
source tel-helpers
log_no_newline "Loading Things"
log_replace_last "..."
sleep 0.1
	sleep 1

# Handle motd hints system if user changes config option
#if  [ $MOTD_HINTS == "true" ] ; then # backup user motd and restore if hints disabled
#	[[ ! -f ~/../usr/etc/.motd.bak ]] && cp -f ~/../usr/etc/motd ~/../usr/etc/.motd.bak && log "Backed up and enabled motd hints at startup ${CHECK_MARK}" && sleep 1
#	cp -f ~/../usr/etc/motd_hints ~/../usr/etc/motd && ~/.tel/scripts/hints.sh
#else
#	[[ -f ~/../usr/etc/.motd.bak ]] && mv -f ~/../usr/etc/.motd.bak ~/../usr/etc/motd && log "Restored user motd ${CHECK_MARK}" && sleep 1
#fi

if [ $SSH_SERVER == "true" ] ; then
	log_no_newline "launching ssh server"
	sshd
	log_replace_last "launched ssh server ${CHECK_MARK}"
	sleep 1
fi

if [ "$NOTIFICATIONS_ENABLED" == "true" ] ; then
	log_no_newline "launching notification daemon"
	nohup ~/.tel/scripts/get_notifications.py > /dev/null 2>&1 &
	log_replace_last "launched notification daemon ${CHECK_MARK}"
	sleep 0.1
	sleep 1
fi

if [ "$STARTUP_ANIMATION_ENABLED" == "true" ] ; then
	log_no_newline 'launching animation'
	#if [ $USE_TMUX == "true" ] ; then
	#	tmux new-window -n 'ctrl+c = skip' 'python ~/.tel/scripts/animation.py' 
	#else
	python ~/.tel/scripts/animation.py
	#fi
	log_replace_last "launched python animation ${CHECK_MARK}"
	sleep 0.1
	sleep 1
fi

if [ "$STATUS_WINDOW_ENABLED" == "true" ] ; then
	running=$(pgrep -f status_manager.py)
	if [ -z "$running" ] ; then
		log_no_newline 'launching status manager'
		nohup ~/.tel/scripts/status_manager/toggle_ui.sh > /dev/null 2>&1 &
		log_replace_last "launched status manager ${CHECK_MARK}"
	sleep 0.1
	sleep 1
	fi
fi

log "Ready!      ${CHECK_MARK}"
	sleep 0.1
	sleep 1
exit 0
