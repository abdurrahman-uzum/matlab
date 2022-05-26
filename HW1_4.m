% EED1012 28 04 2020 Abdurrahman ÜZÜM 2019502099 

clear;
clc;

prompt = 'Enter first operand: ';
x = input(prompt);

prompt = 'Enter second operand: ';
y = input(prompt);

prompt = 'Choose operation: ';
opr = input(prompt);

switch opr
    case 1
        x^y
        
    case 2
        log(y)/log(x)
                
    case 3
        x^2 + 2*x*y + y^2
        
    case 4
        x^(1/3) + y^(1/5)
        
    otherwise
        disp( 'Invalid operand' );        
end
