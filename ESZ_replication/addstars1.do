
global num=string(real("$num"),"%9.3f")

if real("$num")<=.1&real("$num")>.05 {
	global num="$num"+"$^{*}$"
}
else if real("$num")<=.05&real("$num")>.01 {	
	global num="$num"+"$^{**}$"
}
else if real("$num")<=.01 {	
	global num="$num"+"$^{***}$"
}
