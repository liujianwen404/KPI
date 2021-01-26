cd .
call mvn compile jib:build -DsendCredentialsOverHttp=true 

echo 按任意键结束...
pause>nul
exit
