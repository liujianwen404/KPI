cd .
call mvn compile jib:build -DsendCredentialsOverHttp=true -Pprod -Ddocker.username=%1 -Ddocker.password=%2

echo ��������˳�...
pause>nul
exit
