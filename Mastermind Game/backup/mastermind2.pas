program mastermind2;
uses CRT;
var
rnd: integer;
ans :array[1..4] of integer;
input :array[1..4] of integer;
win: Boolean;
flag:Boolean;
quit : Boolean;
procedure initialize;
begin
win := FALSE ;
quit := FALSE;
Repeat
randomize;
ans[1] := random(10);
ans[2] := random(10);
ans[3] := random(10);
ans[4] := random(10);
until ((((ans[1] <> ans[2])and(ans[1]<>ans[3]))and(ans[1]<>ans[4])))and(((ans[2]<>ans[3])and ((ans[2]<>ans[4])and (ans[3] <>ans[4]))));
end;

procedure user_input;
begin
writeln();
Writeln('Round',rnd);
write('Guess the leftmost digit of the 4-digit number(0-9):');
readln(input[1]);
write('Guess the second digit count from the left of the 4-digit number(0-9):');
readln(input[2]);
write('Guess the third leftmost digit of the 4-digit number(0-9):');
readln(input[3]);
write('Guess the last digit of the 4-digit number(0-9):');
readln(input[4]);
end;

procedure stopplaying;
var GOON : String ;
begin
write('Continue? (Type NO(or no) to exit):');
 readln(GOON);
 if ((GOON='NO' ) Or (GOON='no')) THEN
 quit:=TRUE;
end;

procedure Checkvail;
var i,j:integer;

begin
   begin
  for i := 1 to 4 do
        begin
        if (input[i] > 9) then
                                                                                          {check if the input obey the rules}
                flag := FALSE

         else if (input[i] <-1 )
         then
         flag := FALSE
         else
         begin
                for j := 1 to 4 do
                begin
                        if  i<>j then
                        begin
                        if input[i] = input[j] then
                                        flag := FALSE;

                        end;
                end;
          end;
         end;
        end;
   if not flag then
        writeln('Plase re-enter');
end;

procedure anscheck;
var i,n,white,red: integer;
begin
white := 0;
red := 0;
if ((input[1] = ans[1]) and (input[2] = ans[2] ))then
        begin
        if(( input[3] = ans[3]) and(input[4] = ans[4]))
         then begin
         win := TRUE;
         flag := false;
         end
        end;
if flag  then
        begin
        for i :=1 to 4  do
            begin
              if input[i] = ans[i] then
              begin
              red := red + 1 ;

                 end;

      for n:= 1 to 4 do
        begin
                if n<>i then
                begin
                        if input[i] = ans[n]
                        then begin
                        white := white +1;

                                end
                end;

        end;
      end;
      end;


      while red > 0 do
      begin                                                                                            {red *}
           textcolor(4);
           write('*');
           textcolor(7);
           red := red -1;
      end;

      while white > 0 do                                                              {white *}
      begin
           textcolor(15);
           write('*');
           textcolor(7);
           white := white -1;
      end
end;


procedure celebrate;
var cele: integer;
begin
CLRSCR;
repeat
for cele := 1 TO 100 DO
begin
        textcolor(Random(15)+1);
        write('YOUWIN!');
        end;
until keypressed ;
end;

begin
WRITELN('MASTERMIND');
writeln();
WRITELN('INSTRUCTIONS');
writeln('It is a single player game.');
WRITELN('1.The computer will random pack a 4 NON-REPEATED integers.');
WRITELN('2.Make your guess.');
WRITELN('3.The computer will give you feedback');
WRITE('4.Each');
textcolor(15);
write('*');
textcolor(7);
writeln('means that one of the guessed integers is correct,');
writeln('  but is in the wrong position.');
WRITE('5.Each');
textcolor(4);
write('*');
textcolor(7);
writeln('means that one of the guessed integers is correct,');
writeln('  and is in the right position.');
writeln('6.The order of the * is NOT relavent');
writeln('7.When you finish a round, the computer will ask you');
writeln('  if you continue playing.');
writeln('8.If you continue playing PRESS ANY KEY to continue.') ;
WRITELN('9.OTHERWISE TYPE NO or no to quit the game.');
WRITELN();
writeln('Press any key to play');
readln();
CLRSCR ;
initialize;
rnd := 1;
repeat
user_input;
flag := TRUE;
checkvail;
if flag then
begin
anscheck;
rnd:= rnd +1;
WRITELN;
if (not win) then
stopplaying;
END;
until (win or quit);
IF WIN THEN
BEGIN
Writeln('YOU FINISH THE GAME IN', rnd-1 ,'ROUND(S)');
Writeln('Tap enter to celebrate your Success. Thank you for playing!!');
readln();
celebrate;
CLRSCR
END
end.
