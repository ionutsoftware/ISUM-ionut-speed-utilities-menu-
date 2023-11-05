
;ionut speed utilities menu
;created by ionut software on february 2023
;this script ofers you various posibilities in an intwitive menu.
;the next commands sequence are going to start the program and create the menu's options

soundBeep, 500, 500
Menu, startmenu, add, apagado del sistema submenú, shut
Menu, startmenu, add, acceder a la carpeta de usuario (%A_UserName%), userfolder
Menu, startmenu, add, descargas, downloads
Menu, startmenu, add, documentos, documents
Menu, startmenu, add, abrir diálogo de ejecutar, run
Menu, startmenu, add, abrir cmd, console
Menu, startmenu, add, calculadora simple, simplecalculator
Menu, startmenu, add, apagar el programa, exit

Menu, shutdownmenu, add, apagar, shutdown
Menu, shutdownmenu, add, reiniciar, restart
Menu, shutdownmenu, add, suspender, suspend
Menu, shutdownmenu, add, reiniciar en modo seguro, shuremode
return
;menu's actions:
userfolder:
Run, explorer.exe shell:UsersFilesFolder
return
downloads:
run, explorer.exe "C:\Users\%A_UserName%\downloads"
return
documents:
run, explorer.exe "C:\Users\%A_UserName%\documents"
return
shut:
Menu, shutdownmenu, show
return

run:
send, #r
return
console:
run cmd.exe
return
web:
run, https://github.com/ionutsoftware/isum
return
exit:
soundBeep, 400, 500
exitApp
return
shutdown:
shutdown, 1
restart:
shutdown, 2
return
suspend:
Sleep, 1000
DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
return
shuremode:
shutdown, 4
return
^+a::
menu, startmenu, show
return
simplecalculator:
inputBox, operacion, operación, introduce la operación.
if(operacion = "") {
return
}else{
calculator(operacion)
}
return
createfiles(textoenarchivos, nombrearchivos)
{
/*
this function helps you for create files in AHK. developed by ionut software on 14.4.2023
*/
;checking if the file alrready exists
if(fileExist(nombrearchivos)) {
;if the file are alrready exists, the user haves an litle msgbox
msgbox, 0, program internal error, the file alrready exists
} else {
;create the file
archivo:=fileOpen(nombrearchivos, "w")
archivo.write(textoenarchivos)
archivo.close()
}
}
calculator(operation)
{
/*
calculator function
developed by sebi on 15.4.2023
this function makes you more easy the create a litle calculator. this calculator can makes this operations:
- suma
- resta
- multiplication
- division
the use of this function its very easy. you only need to write calculator(name_of_string).
*/
;split the operators, and put the numbers and the operator (+, -, /, *) in different bariables.
nums:=strSplit(operation, " ")
n1:=nums[1]
n2:=nums[3]
operator:=nums[2]
;make the different operations using ifs to find the operator.

if (operator = "+") {
result:=n1+n2
} else if (operator = "-") {
result:=n1-n2
} else if (operator = "*") {
result:=n1*n2
} else if (operator = "/") {
result:=n1/n2
} else if (operator = "^") {
result:=n1**n2
} else {
;if the operator its not exists or its not visualiced by the program
MsgBox, 16, internal error, the operator is not admised in this calculator. please contact the developer for more information.
return
}
;if the operation string are empty
if (operation = "") {
return
}
;if the operator exists, the function makes the operation and print the result
msgBox, 4096, response, %result%
clipboard = %result%
}